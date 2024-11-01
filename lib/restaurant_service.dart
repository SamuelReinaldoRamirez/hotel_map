// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'restaurant.dart';

// class RestaurantService {
//   Future<List<Restaurant>> fetchRestaurants() async {
//     final response = await http.get(Uri.parse('https://x8ki-letl-twmt.n7.xano.io/api:LYxWamUX/restaurants')); // Remplace avec ton endpoint

//     if (response.statusCode == 200) {
//       List<dynamic> data = json.decode(response.body);
//       return data.map((json) => Restaurant.fromJson(json)).toList();
//     } else {
//       throw Exception('Failed to load restaurants');
//     }
//   }
// }

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'restaurant.dart';

class RestaurantService {
  Future<List<Restaurant>> fetchRestaurants() async {
    try {
      // Log d'appel au service
      print('Fetching restaurants from API...');
      final response = await http.get(Uri.parse('https://x8ki-letl-twmt.n7.xano.io/api:LYxWamUX/restaurants_forHotelApp'));

      // Log de la réponse brute pour vérifier le statut
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);

        // Log pour vérifier le contenu du JSON décodé
        print('Decoded JSON data: $data');


        // Afficher la couleur avant la conversion
        for (var jsonRestaurant in data) {
          // Vérifiez si le champ 'color' est présent dans l'objet JSON
          if (jsonRestaurant['color'] != null) {
            print("Restaurant: ${jsonRestaurant['name']}, Color: ${jsonRestaurant['color']}");
          } else {
            print("Restaurant: ${jsonRestaurant['name']}, Color: null");
          }
        }

        
        List<Restaurant> restaurants = data.map((json) => Restaurant.fromJson(json)).toList();
        
        // Log de confirmation du nombre de restaurants récupérés
        print('Number of restaurants fetched: ${restaurants.length}');
        
        return restaurants;
      } else {
        // Log d'erreur si le code de statut n'est pas 200
        print('Error: Failed to load restaurants. Status code: ${response.statusCode}');
        throw Exception('Failed to load restaurants');
      }
    } catch (e) {
      // Log d'erreur pour capturer toute autre exception
      print('Exception caught: $e');
      throw Exception('Failed to load restaurants due to an exception');
    }
  }
}

