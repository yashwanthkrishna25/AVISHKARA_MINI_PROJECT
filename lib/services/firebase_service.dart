// // lib/services/firebase_service.dart
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class FirebaseService {
//   final FirebaseFirestore _db = FirebaseFirestore.instance;
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   // Static fallback runtime arrays to keep data alive if Firebase isn't authenticated yet
//   static final List<Map<String, dynamic>> _localVehiclesBackup = [
//     {'brand': 'KIA', 'plate': 'TS-09-EA-1234', 'owner': 'Prasad', 'status': 'Default'},
//   ];
//   static final List<Map<String, dynamic>> _localBookingsBackup = [];

//   // Safely grab user token IDs
//   String? get _userId => _auth.currentUser?.uid;

//   // --- VEHICLE OPERATIONS ---
//   Stream<List<Map<String, dynamic>>> streamVehicles() {
//     final uid = _userId;
//     if (uid == null) {
//       // If user isn't logged into Firebase Auth, fall back to local memory streams
//       return Stream.value(_localVehiclesBackup);
//     }
//     return _db
//         .collection('users')
//         .doc(uid)
//         .collection('vehicles')
//         .orderBy('createdAt', descending: true)
//         .snapshots()
//         .map((snap) => snap.docs.map((doc) {
//               var data = doc.data();
//               data['id'] = doc.id;
//               return data;
//             }).toList());
//   }

//   Future<void> addVehicle({
//     required String brand,
//     required String plate,
//     required String owner,
//     required bool isDefault,
//   }) async {
//     final uid = _userId;
//     final Map<String, dynamic> vehiclePayload = {
//       'brand': brand,
//       'plate': plate,
//       'owner': owner,
//       'status': isDefault ? 'Default' : 'Secondary',
//       'createdAt': DateTime.now().toIso8601String(),
//     };

//     if (uid == null) {
//       if (isDefault) {
//         for (var v in _localVehiclesBackup) { v['status'] = 'Secondary'; }
//       }
//       _localVehiclesBackup.insert(0, vehiclePayload);
//       return;
//     }

//     final ref = _db.collection('users').doc(uid).collection('vehicles');
//     if (isDefault) {
//       final query = await ref.where('status', isEqualTo: 'Default').get();
//       final batch = _db.batch();
//       for (var doc in query.docs) {
//         batch.update(doc.reference, {'status': 'Secondary'});
//       }
//       await batch.commit();
//     }
//     await ref.add({
//       ...vehiclePayload,
//       'createdAt': FieldValue.serverTimestamp(),
//     });
//   }

//   // --- BOOKING OPERATIONS ---
//   Stream<List<Map<String, dynamic>>> streamBookings() {
//     final uid = _userId;
//     if (uid == null) {
//       return Stream.value(_localBookingsBackup);
//     }
//     return _db
//         .collection('users')
//         .doc(uid)
//         .collection('bookings')
//         .orderBy('createdAt', descending: true)
//         .snapshots()
//         .map((snap) => snap.docs.map((doc) => doc.data()).toList());
//   }

//   Future<void> saveBooking(Map<String, dynamic> bookingData) async {
//     final uid = _userId;
//     if (uid == null) {
//       _localBookingsBackup.insert(0, bookingData);
//       return;
//     }
//     await _db
//         .collection('users')
//         .doc(uid)
//         .collection('bookings')
//         .doc(bookingData['id'])
//         .set({
//           ...bookingData,
//           'createdAt': FieldValue.serverTimestamp(),
//         });
//   }
// }

// // lib/services/firebase_service.dart
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class FirebaseService {
//   final FirebaseFirestore _db = FirebaseFirestore.instance;
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   // Runtime RAM backup storage initialized with a fallback dummy vehicle
//   static final List<Map<String, dynamic>> _localVehiclesFallback = [
//     {'brand': 'KIA', 'plate': 'TS-09-EA-1234', 'owner': 'Prasad', 'status': 'Default'},
//   ];

//   // 🎫 FIX: Added an active dummy ticket baseline directly here so the history tab is never empty!
//   static final List<Map<String, dynamic>> _localBookingsFallback = [
//     {
//       'id': 'PKZ-777888',
//       'facility': 'Hitech City Smart Parking (Dummy)',
//       'slot': 'P-12',
//       'plate': 'TS-09-EA-1234',
//       'time': 'Today, 2 Hour Window',
//       'amount': '₹30',
//       'status': 'active'
//     }
//   ];

//   String? get _userId => _auth.currentUser?.uid;

//   // --- VEHICLES CORRIDOR ---
//   Stream<List<Map<String, dynamic>> > streamVehicles() {
//     final uid = _userId;
//     if (uid == null) return Stream.value(_localVehiclesFallback);
    
//     return _db
//         .collection('users')
//         .doc(uid)
//         .collection('vehicles')
//         .orderBy('createdAt', descending: true)
//         .snapshots()
//         .map((snap) => snap.docs.map((doc) {
//               var data = doc.data();
//               data['id'] = doc.id;
//               return data;
//             }).toList());
//   }

//   Future<void> addVehicle({
//     required String brand,
//     required String plate,
//     required String owner,
//     required bool isDefault,
//   }) async {
//     final uid = _userId;
//     final Map<String, dynamic> payload = {
//       'brand': brand,
//       'plate': plate,
//       'owner': owner,
//       'status': isDefault ? 'Default' : 'Secondary',
//     };

//     if (uid == null) {
//       if (isDefault) {
//         for (var v in _localVehiclesFallback) { v['status'] = 'Secondary'; }
//       }
//       _localVehiclesFallback.insert(0, payload);
//       return;
//     }

//     final ref = _db.collection('users').doc(uid).collection('vehicles');
//     if (isDefault) {
//       final defaultDocs = await ref.where('status', isEqualTo: 'Default').get();
//       final batch = _db.batch();
//       for (var doc in defaultDocs.docs) {
//         batch.update(doc.reference, {'status': 'Secondary'});
//       }
//       await batch.commit();
//     }
//     await ref.add({...payload, 'createdAt': FieldValue.serverTimestamp()});
//   }

//   // --- BOOKINGS CORRIDOR ---
//   Stream<List<Map<String, dynamic>> > streamBookings() {
//     final uid = _userId;
//     // Returns our dummy list instantly if the cloud firebase has no records yet
//     if (uid == null) return Stream.value(_localBookingsFallback);

//     return _db
//         .collection('users')
//         .doc(uid)
//         .collection('bookings')
//         .orderBy('createdAt', descending: true)
//         .snapshots()
//         .map((snap) => snap.docs.map((doc) => doc.data()).toList());
//   }

//   Future<void> saveBooking(Map<String, dynamic> bookingData) async {
//     final uid = _userId;
    
//     // Inserts the freshly generated live booking right above our dummy list item
//     if (uid == null) {
//       _localBookingsFallback.insert(0, bookingData);
//       return;
//     }
    
//     await _db
//         .collection('users')
//         .doc(uid)
//         .collection('bookings')
//         .doc(bookingData['id'])
//         .set({...bookingData, 'createdAt': FieldValue.serverTimestamp()});
//   }
// }



// // lib/services/firebase_service.dart
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class FirebaseService {
//   final FirebaseFirestore _db = FirebaseFirestore.instance;
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   // Global static persistence variables layer
//   static final List<Map<String, dynamic>> _localVehiclesFallback = [
//     {'brand': 'KIA', 'plate': 'TS-09-EA-1234', 'owner': 'Prasad', 'status': 'Default'},
//   ];

//   // This static array acts as our reliable global browser storage pool
//   static final List<Map<String, dynamic>> _localBookingsFallback = [];

//   String? get _userId => _auth.currentUser?.uid;

//   // --- VEHICLES CORRIDOR ---
//   Stream<List<Map<String, dynamic>>> streamVehicles() {
//     final uid = _userId;
//     if (uid == null) return Stream.value(_localVehiclesFallback);
    
//     return _db
//         .collection('users')
//         .doc(uid)
//         .collection('vehicles')
//         .orderBy('createdAt', descending: true)
//         .snapshots()
//         .map((snap) => snap.docs.map((doc) {
//               var data = doc.data();
//               data['id'] = doc.id;
//               return data;
//             }).toList());
//   }

//   Future<void> addVehicle({
//     required String brand,
//     required String plate,
//     required String owner,
//     required bool isDefault,
//   }) async {
//     final uid = _userId;
//     final Map<String, dynamic> payload = {
//       'brand': brand,
//       'plate': plate,
//       'owner': owner,
//       'status': isDefault ? 'Default' : 'Secondary',
//     };

//     if (uid == null) {
//       if (isDefault) {
//         for (var v in _localVehiclesFallback) { v['status'] = 'Secondary'; }
//       }
//       _localVehiclesFallback.insert(0, payload);
//       return;
//     }

//     final ref = _db.collection('users').doc(uid).collection('vehicles');
//     if (isDefault) {
//       final defaultDocs = await ref.where('status', isEqualTo: 'Default').get();
//       final batch = _db.batch();
//       for (var doc in defaultDocs.docs) {
//         batch.update(doc.reference, {'status': 'Secondary'});
//       }
//       await batch.commit();
//     }
//     await ref.add({...payload, 'createdAt': FieldValue.serverTimestamp()});
//   }

//   // --- BOOKINGS CORRIDOR ---
//   Stream<List<Map<String, dynamic>>> streamBookings() {
//     final uid = _userId;
    
//     // ✅ CRITICAL FIX: Explicitly returns the persistent memory array as a continuous stream stream
//     if (uid == null) {
//       return Stream.periodic(const Duration(milliseconds: 100))
//           .map((_) => List<Map<String, dynamic>>.from(_localBookingsFallback));
//     }

//     return _db
//         .collection('users')
//         .doc(uid)
//         .collection('bookings')
//         .orderBy('createdAt', descending: true)
//         .snapshots()
//         .map((snap) => snap.docs.map((doc) => doc.data()).toList());
//   }

//   Future<void> saveBooking(Map<String, dynamic> bookingData) async {
//     final uid = _userId;
    
//     if (uid == null) {
//       // ✅ CRITICAL FIX: Insert fresh data straight into the global persist snapshot pool
//       _localBookingsFallback.insert(0, bookingData);
//       return;
//     }
    
//     await _db
//         .collection('users')
//         .doc(uid)
//         .collection('bookings')
//         .doc(bookingData['id'])
//         .set({...bookingData, 'createdAt': FieldValue.serverTimestamp()});
//   }
// }



// lib/services/firebase_service.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class FirebaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  static final List<Map<String, dynamic>> _localVehiclesFallback = [
    {'brand': 'KIA', 'plate': 'TS-09-EA-1234', 'owner': 'Prasad', 'status': 'Default'},
  ];

  // Global Notifier broadcasts mutations dynamically to all listening UI trees
  static final ValueNotifier<List<Map<String, dynamic>>> localBookingsNotifier = 
      ValueNotifier<List<Map<String, dynamic>>>([]);

  String? get _userId => _auth.currentUser?.uid;

  Stream<List<Map<String, dynamic>>> streamVehicles() {
    final uid = _userId;
    if (uid == null) return Stream.value(_localVehiclesFallback);
    
    return _db
        .collection('users')
        .doc(uid)
        .collection('vehicles')
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snap) => snap.docs.map((doc) {
              var data = doc.data();
              data['id'] = doc.id;
              return data;
            }).toList());
  }

  Future<void> addVehicle({
    required String brand,
    required String plate,
    required String owner,
    required bool isDefault,
  }) async {
    final uid = _userId;
    final Map<String, dynamic> payload = {
      'brand': brand,
      'plate': plate,
      'owner': owner,
      'status': isDefault ? 'Default' : 'Secondary',
    };

    if (uid == null) {
      if (isDefault) {
        for (var v in _localVehiclesFallback) { v['status'] = 'Secondary'; }
      }
      _localVehiclesFallback.insert(0, payload);
      return;
    }

    final ref = _db.collection('users').doc(uid).collection('vehicles');
    if (isDefault) {
      final defaultDocs = await ref.where('status', isEqualTo: 'Default').get();
      final batch = _db.batch();
      for (var doc in defaultDocs.docs) {
        batch.update(doc.reference, {'status': 'Secondary'});
      }
      await batch.commit();
    }
    await ref.add({...payload, 'createdAt': FieldValue.serverTimestamp()});
  }

  Stream<List<Map<String, dynamic>>> streamBookings() {
    final uid = _userId;
    if (uid == null) {
      // Stream updates smoothly directly from our ValueNotifier source
      return Stream.value(localBookingsNotifier.value);
    }

    return _db
        .collection('users')
        .doc(uid)
        .collection('bookings')
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snap) => snap.docs.map((doc) => doc.data()).toList());
  }

  Future<void> saveBooking(Map<String, dynamic> bookingData) async {
    final uid = _userId;
    
    if (uid == null) {
      // Append item locally and trigger value listeners across viewports
      final currentList = List<Map<String, dynamic>>.from(localBookingsNotifier.value);
      currentList.insert(0, bookingData);
      localBookingsNotifier.value = currentList;
      return;
    }
    
    await _db
        .collection('users')
        .doc(uid)
        .collection('bookings')
        .doc(bookingData['id'])
        .set({...bookingData, 'createdAt': FieldValue.serverTimestamp()});
  }
}