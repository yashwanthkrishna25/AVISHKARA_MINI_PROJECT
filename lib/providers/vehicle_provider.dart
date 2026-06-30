import 'package:flutter/material.dart';
import '../models/vehicle_model.dart';

class VehicleProvider extends ChangeNotifier {
  final List<VehicleModel> _vehicles = [];

  List<VehicleModel> get vehicles => _vehicles;

  void addVehicle(VehicleModel vehicle) {
    _vehicles.add(vehicle);
    notifyListeners();
  }

  void removeVehicle(String id) {
    _vehicles.removeWhere((v) => v.id == id);
    notifyListeners();
  }

  void updateVehicle(VehicleModel vehicle) {
    final index = _vehicles.indexWhere((v) => v.id == vehicle.id);
    if (index != -1) {
      _vehicles[index] = vehicle;
      notifyListeners();
    }
  }

  void setDefaultVehicle(String id) {
    for (int i = 0; i < _vehicles.length; i++) {
      _vehicles[i] = _vehicles[i].copyWith(
        isDefault: _vehicles[i].id == id,
      );
    }
    notifyListeners();
  }
}