class BookingModel {
  final String id;
  final String userId;
  final String parkingId;
  final String slotNumber;
  final DateTime startTime;
  final DateTime endTime;
  final double totalAmount;
  final String status; // pending, active, completed

  BookingModel({
    required this.id,
    required this.userId,
    required this.parkingId,
    required this.slotNumber,
    required this.startTime,
    required this.endTime,
    required this.totalAmount,
    required this.status,
  });

  Map<String, dynamic> toMap() => {
        'userId': userId,
        'parkingId': parkingId,
        'slotNumber': slotNumber,
        'startTime': startTime.toIso8601String(),
        'endTime': endTime.toIso8601String(),
        'totalAmount': totalAmount,
        'status': status,
      };
}