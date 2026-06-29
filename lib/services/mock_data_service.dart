// lib/services/mock_data_service.dart
// import '../../models/booking_model.dart';
import '../../services/mock_data_service.dart';



class MockDataService {
  /// 🚗 Central Persistent Vehicles Store
  /// Holds all registered vehicle profiles. Whenever you complete the 
  /// 'Add Vehicle' form, the data map fields append straight into this array.
  static final List<Map<String, String>> vehicles = [
    {
      'brand': 'KIA', 
      'plate': 'TS-09-EA-1234', 
      'owner': 'Prasad', 
      'status': 'Default'
    },
    {
      'brand': 'Hyundai', 
      'plate': 'TS-07-HR-5678', 
      'owner': 'Yashwanth', 
      'status': 'Secondary'
    },
  ];

  /// 🎫 Central Persistent Parking Bookings Store
  /// Starts as an empty array log stack. Every time a user clicks "Book Spot" 
  /// on the Hyderabad map pins, a randomized code block object is generated 
  /// and inserted into this list to show up in the history tracker feed.
  static final List<Map<String, dynamic>> bookings = [];
}