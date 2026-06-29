import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/parking_model.dart';

class ParkingService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Stream all available locations to display as markers on the Flutter Map
  Stream<List<ParkingLocation>> streamNearbyFacilities() {
    return _firestore.collection('parkings').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return ParkingLocation.fromMap(doc.data(), doc.id);
      }).toList();
    });
  }

  // Stream real-time real-estate capacity configurations for a specific site
  Stream<Map<String, dynamic>> streamSlotStatuses(String parkingId) {
    return _firestore
        .collection('parkings')
        .doc(parkingId)
        .collection('slots')
        .snapshots()
        .map((snapshot) {
          final Map<String, dynamic> slotMap = {};
          for (var doc in snapshot.docs) {
            slotMap[doc.id] = doc.data(); // e.g., {'P-1': {'isOccupied': true, 'reservedBy': 'id'}}
          }
          return slotMap;
        });
  }

  // Atomically claim a parking slot to eliminate duplicate booking collisions
  Future<bool> occupySlotTransaction({
    required String parkingId,
    required String slotId,
    required String userId,
    required Map<String, dynamic> bookingData,
  }) async {
    final DocumentReference slotRef = _firestore
        .collection('parkings')
        .doc(parkingId)
        .collection('slots')
        .doc(slotId);
        
    final DocumentReference bookingRef = _firestore.collection('bookings').doc();

    try {
      return await _firestore.runTransaction<bool>((transaction) async {
        DocumentSnapshot slotSnapshot = await transaction.get(slotRef);

        if (slotSnapshot.exists && (slotSnapshot.get('isOccupied') == true)) {
          // Slot was snatched up right before transaction processing window
          return false; 
        }

        // Apply synchronized state update transforms across documents
        transaction.update(slotRef, {
          'isOccupied': true,
          'occupiedBy': userId,
          'updatedAt': FieldValue.serverTimestamp(),
        });

        transaction.set(bookingRef, {
          ...bookingData,
          'createdAt': FieldValue.serverTimestamp(),
        });

        return true;
      });
    } catch (e) {
      print('Transaction fault sequence: $e');
      return false;
    }
  }
}