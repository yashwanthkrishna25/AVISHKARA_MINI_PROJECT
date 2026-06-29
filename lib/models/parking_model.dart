class ParkingLocation {
  final String id;
  final String name;
  final String address;
  final double latitude;
  final double longitude;
  final double pricePerHour;
  final int totalSlots;

  ParkingLocation({
    required this.id,
    required this.name,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.pricePerHour,
    required this.totalSlots,
  });

  factory ParkingLocation.fromMap(Map<String, dynamic> map, String docId) {
    return ParkingLocation(
      id: docId,
      name: map['name'] ?? '',
      address: map['address'] ?? '',
      latitude: (map['latitude'] as num).toDouble(),
      longitude: (map['longitude'] as num).toDouble(),
      pricePerHour: (map['pricePerHour'] as num).toDouble(),
      totalSlots: map['totalSlots'] ?? 0,
    );
  }
}