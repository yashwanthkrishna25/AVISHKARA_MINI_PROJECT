import 'dart:math';

class MapGenerator {
  static final Random _random = Random();

  static List<Map<String, dynamic>> generateZones({int count = 6}) {
    return List.generate(count, (index) {
      return {
        "id": "zone_$index",
        "name": "Zone ${index + 1}",
        "distance": _random.nextInt(10) + 1,
        "price": (_random.nextInt(5) + 1) * 10,
        "totalSlots": _random.nextInt(20) + 10,
        "availableSlots": _random.nextInt(10) + 5,
      };
    });
  }

  static List<Map<String, dynamic>> generateSlots(int total) {
    return List.generate(total, (index) {
      return {
        "id": "S$index",
        "status": _random.nextBool() ? "available" : "booked",
      };
    });
  }
}