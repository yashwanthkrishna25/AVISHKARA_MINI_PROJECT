import 'package:flutter/material.dart';
import '../core/utils/map_generator.dart';

class ParkingProvider extends ChangeNotifier {
  List<Map<String, dynamic>> zones = [];
  List<Map<String, dynamic>> slots = [];

  String? selectedZoneId;

  void loadZones() {
    zones = MapGenerator.generateZones(count: 8);
    notifyListeners();
  }

  void selectZone(String zoneId, int totalSlots) {
    selectedZoneId = zoneId;
    slots = MapGenerator.generateSlots(totalSlots);
    notifyListeners();
  }

  void toggleSlot(int index) {
    if (slots[index]["status"] == "booked") return;

    slots[index]["status"] =
        slots[index]["status"] == "available" ? "selected" : "available";

    notifyListeners();
  }
}