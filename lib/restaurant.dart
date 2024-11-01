// // lib/restaurant.dart

// class Restaurant {
//   final String name;
//   final double latitude;
//   final double longitude;
//   final int public;

//   Restaurant({
//     required this.name,
//     required this.latitude,
//     required this.longitude,
//     required this.public,
//   });

//   factory Restaurant.fromJson(Map<String, dynamic> json) {
//     return Restaurant(
//       name: json['name'] ?? '',
//       latitude: (json['latitude'] ?? 0.0).toDouble(),
//       longitude: (json['longitude'] ?? 0.0).toDouble(),
//       public: json['public'] ?? 0,
//     );
//   }
// }


class Restaurant {
  final String name;
  final double latitude;
  final double longitude;
  final int color;

  Restaurant({
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.color,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    print("----------------------------------------");
    print(json['color']);
    // Extraction des coordonnées GPS et gestion des valeurs par défaut
    final gpsData = json['GPS_address']?['data'] ?? {};
    return Restaurant(
      name: json['name'] ?? '',
      latitude: (gpsData['lat'] ?? 0.0).toDouble(),
      longitude: (gpsData['lng'] ?? 0.0).toDouble(),
      color: json['color'] ?? 0,
    );
  }
}
