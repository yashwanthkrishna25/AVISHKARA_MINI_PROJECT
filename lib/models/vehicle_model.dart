class VehicleModel {
  final String id;
  final String ownerName;
  final String vehicleNumber;
  final String brand;
  final String model;
  final String color;
  final String type;
  final bool isDefault;

  VehicleModel({
    required this.id,
    required this.ownerName,
    required this.vehicleNumber,
    required this.brand,
    required this.model,
    required this.color,
    required this.type,
    this.isDefault = false,
  });

  VehicleModel copyWith({
    String? id,
    String? ownerName,
    String? vehicleNumber,
    String? brand,
    String? model,
    String? color,
    String? type,
    bool? isDefault,
  }) {
    return VehicleModel(
      id: id ?? this.id,
      ownerName: ownerName ?? this.ownerName,
      vehicleNumber: vehicleNumber ?? this.vehicleNumber,
      brand: brand ?? this.brand,
      model: model ?? this.model,
      color: color ?? this.color,
      type: type ?? this.type,
      isDefault: isDefault ?? this.isDefault,
    );
  }
}