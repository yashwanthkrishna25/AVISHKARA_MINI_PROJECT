import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/booking_model.dart';

class BookingProvider extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<bool> createBooking(BookingModel booking) async {
    _isLoading = true;
    notifyListeners();
    try {
      // Create new transaction booking document reference
      final docRef = _firestore.collection('bookings').doc();
      await docRef.set(booking.toMap());
      
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Stream<List<BookingModel>> fetchUserBookings(String userId) {
    return _firestore
        .collection('bookings')
        // .where('userId', ==: userId)
        // Change this line:
// .where('userId', ==: userId)

// To this:
.where('userId', isEqualTo: userId)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => BookingModel(
                  id: doc.id,
                  userId: doc['userId'],
                  parkingId: doc['parkingId'],
                  slotNumber: doc['slotNumber'],
                  startTime: DateTime.parse(doc['startTime']),
                  endTime: DateTime.parse(doc['endTime']),
                  totalAmount: (doc['totalAmount'] as num).toDouble(),
                  status: doc['status'],
                ))
            .toList());
  }
}