class ParkingModel {
  final String name;
  final String address;
  final String image;
  final double rating;
  final int totalSlots;
  final int availableSlots;
  final int price;

  ParkingModel({
    required this.name,
    required this.address,
    required this.image,
    required this.rating,
    required this.totalSlots,
    required this.availableSlots,
    required this.price,
  });
}