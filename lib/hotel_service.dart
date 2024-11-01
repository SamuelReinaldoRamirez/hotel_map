import 'dart:convert';
import 'package:http/http.dart' as http;
import 'hotel.dart';

class HotelService {
  final String apiUrl = 'https://x8ki-letl-twmt.n7.xano.io/api:LYxWamUX/hotels';

  Future<List<Hotel>> fetchHotels() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Hotel.fromJson(json)).toList();
    } else {
      throw Exception('Erreur de chargement des hôtels depuis l\'API');
    }
  }
}
