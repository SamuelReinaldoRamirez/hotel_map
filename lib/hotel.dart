
class Hotel {
  final int id;
  final String name;
  final String placeID;
  final String adresse;
  final double latitude;
  final double longitude;
  final String status;
  final String type;

  Hotel({
    required this.id,
    required this.name,
    required this.placeID,
    required this.adresse,
    required this.latitude,
    required this.longitude,
    required this.status,
    required this.type,
  });

  factory Hotel.fromJson(Map<String, dynamic> json) {
    return Hotel(
      id: json['id'],
      name: json['name'],
      placeID: json['placeID'],
      adresse: json['adresse'],
      latitude: json['gps']['data']['lat'],
      longitude: json['gps']['data']['lng'],
      status: json['status'],
      type: json['type'],
    );
  }
}
