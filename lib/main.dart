//JUSTE HOTELS
// import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:latlong2/latlong.dart';
// import 'hotel_service.dart';
// import 'hotel.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Hotel Map',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const HotelMap(),
//     );
//   }
// }

// class HotelMap extends StatefulWidget {
//   const HotelMap({super.key});

//   @override
//   _HotelMapState createState() => _HotelMapState();
// }

// class _HotelMapState extends State<HotelMap> {
//   late Future<List<Hotel>> futureHotels;

//   @override
//   void initState() {
//     super.initState();
//     futureHotels = HotelService().fetchHotels();
//   }

//   void _showHotelDetails(BuildContext context, String hotelName) {
//     showModalBottomSheet(
//       context: context,
//       builder: (BuildContext context) {
//         return Container(
//           padding: const EdgeInsets.all(16.0),
//           height: 100,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 hotelName,
//                 style: const TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 8),
//               Text(
//                 'Détails supplémentaires peuvent être ajoutés ici.',
//                 style: TextStyle(fontSize: 16),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Hotels Map'),
//       ),
//       body: FutureBuilder<List<Hotel>>(
//         future: futureHotels,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Erreur : ${snapshot.error}'));
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return const Center(child: Text('Aucun hôtel trouvé'));
//           }

//           List<Hotel> hotels = snapshot.data!;
//           return FlutterMap(
//             options: MapOptions(
//               initialCenter: LatLng(48.875, 2.306),
//               initialZoom: 14.0,
//             ),
//             children: [
//               TileLayer(
//                 urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
//                 subdomains: const ['a', 'b', 'c'],
//               ),
//               MarkerLayer(
//                 markers: hotels.map((hotel) {
//                   // Déterminer la couleur et l'icône en fonction du statut et du type
//                   Color pinColor;
//                   IconData pinIcon;

//                   // Choisir la couleur du pin selon le statut
//                   if (hotel.status == 'non acquis') {
//                     pinColor = Colors.red;
//                   } else if (hotel.status == 'acquis'){
//                     pinColor = Colors.green;
//                   } else {
//                      pinColor = Colors.orange;// Couleur par défaut
//                   }

//                   // Choisir l'icône en fonction du type d'hébergement
//                   if (hotel.type == 'hôtel') {
//                     pinIcon = Icons.hotel; // Pin pour hôtel
//                   } else if (hotel.type == 'chambre d\'hôtes') {
//                     pinIcon = Icons.home; // Pin pour maison d'hôte
//                   } else if (hotel.type == 'rbnb') {
//                     pinIcon = Icons.apartment; // Pin pour rbnb
//                   } else {
//                     pinIcon = Icons.location_pin; // Pin par défaut
//                   }

//                   return Marker(
//                     point: LatLng(hotel.latitude, hotel.longitude),
//                     width: 40.0,
//                     height: 40.0,
//                     child: GestureDetector(
//                       onTap: () => _showHotelDetails(context, hotel.name),
//                       child: Icon(pinIcon, color: pinColor, size: 40),
//                     ),
//                   );
//                 }).toList(),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }






// HOTELS+RESTOS
// import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:latlong2/latlong.dart';
// import 'hotel_service.dart';
// import 'restaurant_service.dart'; // Nouveau service pour les restaurants
// import 'hotel.dart';
// import 'restaurant.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Hotel & Restaurant Map',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const HotelRestaurantMap(),
//     );
//   }
// }

// class HotelRestaurantMap extends StatefulWidget {
//   const HotelRestaurantMap({super.key});

//   @override
//   _HotelRestaurantMapState createState() => _HotelRestaurantMapState();
// }

// class _HotelRestaurantMapState extends State<HotelRestaurantMap> {
//   late Future<List<Hotel>> futureHotels;
//   late Future<List<Restaurant>> futureRestaurants;
//   bool showHotels = true;
//   bool showRestaurants = true;

//   @override
//   void initState() {
//     super.initState();
//     futureHotels = HotelService().fetchHotels();
//     futureRestaurants = RestaurantService().fetchRestaurants(); // Récupération des restaurants
//   }

//   void _showHotelDetails(BuildContext context, String hotelName) {
//     showModalBottomSheet(
//       context: context,
//       builder: (BuildContext context) {
//         return Container(
//           padding: const EdgeInsets.all(16.0),
//           height: 100,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 hotelName,
//                 style: const TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 8),
//               const Text(
//                 'Détails supplémentaires peuvent être ajoutés ici.',
//                 style: TextStyle(fontSize: 16),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   void _showRestaurantDetails(BuildContext context, String restaurantName) {
//     showModalBottomSheet(
//       context: context,
//       builder: (BuildContext context) {
//         return Container(
//           padding: const EdgeInsets.all(16.0),
//           height: 100,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 restaurantName,
//                 style: const TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 8),
//               const Text(
//                 'Détails supplémentaires peuvent être ajoutés ici.',
//                 style: TextStyle(fontSize: 16),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Hotels & Restaurants Map'),
//       ),
//       body: Stack(
//         children: [
//           FutureBuilder<List<Hotel>>(
//             future: futureHotels,
//             builder: (context, hotelSnapshot) {
//               return FutureBuilder<List<Restaurant>>(
//                 future: futureRestaurants,
//                 builder: (context, restaurantSnapshot) {
//                   if (hotelSnapshot.connectionState == ConnectionState.waiting ||
//                       restaurantSnapshot.connectionState == ConnectionState.waiting) {
//                     return const Center(child: CircularProgressIndicator());
//                   } else if (hotelSnapshot.hasError || restaurantSnapshot.hasError) {
//                     return Center(child: Text('Erreur : ${hotelSnapshot.error ?? restaurantSnapshot.error}'));
//                   }

//                   List<Hotel> hotels = hotelSnapshot.data ?? [];
//                   List<Restaurant> restaurants = restaurantSnapshot.data ?? [];

//                   return FlutterMap(
//                     options: MapOptions(
//                       initialCenter: LatLng(48.875, 2.306),
//                       initialZoom: 14.0,
//                     ),
//                     children: [
//                       TileLayer(
//                         urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
//                         subdomains: const ['a', 'b', 'c'],
//                       ),
//                       if (showHotels)
//                         MarkerLayer(
//                           markers: hotels.map((hotel) {
//                             Color pinColor;
//                             IconData pinIcon;

//                             if (hotel.status == 'non acquis') {
//                               pinColor = Colors.red;
//                             } else if(hotel.status == 'acquis') {
//                               pinColor = Colors.green;
//                             }else {
//                               pinColor = Colors.orange;
//                             }

//                             if (hotel.type == 'hôtel') {
//                               pinIcon = Icons.hotel;
//                             } else if (hotel.type == 'chambre d\'hôtes') {
//                               pinIcon = Icons.home;
//                             } else {
//                               pinIcon = Icons.apartment;
//                             }

//                             return Marker(
//                               point: LatLng(hotel.latitude, hotel.longitude),
//                               width: 40.0,
//                               height: 40.0,
//                               child: GestureDetector(
//                                 onTap: () => _showHotelDetails(context, hotel.name),
//                                 child: Icon(pinIcon, color: pinColor, size: 40),
//                               ),
//                             );
//                           }).toList(),
//                         ),
//                       if (showRestaurants)
//                         MarkerLayer(
//                           markers: restaurants.map((restaurant) {
//                             Color forkColor;
//                             switch (restaurant.public) {
//                               case 0:
//                                 forkColor = Colors.black;
//                                 break;
//                               case 1:
//                                 forkColor = Colors.blue;
//                                 break;
//                               case 2:
//                                 forkColor = Colors.yellow;
//                                 break;
//                               default:
//                                 forkColor = Colors.grey;
//                                 break;
//                             }

//                             return Marker(
//                               point: LatLng(restaurant.latitude, restaurant.longitude),
//                               width: 40.0,
//                               height: 40.0,
//                               child: GestureDetector(
//                                 onTap: () => _showRestaurantDetails(context, restaurant.name),
//                                 child: Icon(Icons.restaurant, color: forkColor, size: 40),
//                               ),
//                             );
//                           }).toList(),
//                         ),
//                     ],
//                   );
//                 },
//               );
//             },
//           ),
//           Positioned(
//             bottom: 16,
//             right: 16,
//             child: Column(
//               children: [
//                 FloatingActionButton(
//                   onPressed: () {
//                     setState(() {
//                       showHotels = !showHotels;
//                     });
//                   },
//                   child: Icon(showHotels ? Icons.hotel : Icons.hotel_outlined),
//                 ),
//                 const SizedBox(height: 8),
//                 FloatingActionButton(
//                   onPressed: () {
//                     setState(() {
//                       showRestaurants = !showRestaurants;
//                     });
//                   },
//                   child: Icon(showRestaurants ? Icons.restaurant : Icons.restaurant_outlined),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }





import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'hotel_service.dart';
import 'restaurant_service.dart'; // Nouveau service pour les restaurants
import 'hotel.dart';
import 'restaurant.dart';

void main() {
  print("Lancement de l'application...");
  runApp(const MyApp());
  print("Application lancée avec succès.");
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    print("Construction du widget MyApp...");
    return MaterialApp(
      title: 'Hotel & Restaurant Map',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HotelRestaurantMap(),
    );
  }
}

class HotelRestaurantMap extends StatefulWidget {
  const HotelRestaurantMap({super.key});

  @override
  _HotelRestaurantMapState createState() => _HotelRestaurantMapState();
}

class _HotelRestaurantMapState extends State<HotelRestaurantMap> {
  late Future<List<Hotel>> futureHotels;
  late Future<List<Restaurant>> futureRestaurants;
  bool showHotels = true;
  bool showRestaurants = true;

  @override
  void initState() {
    super.initState();
    print("Initialisation de HotelRestaurantMap...");
    futureHotels = HotelService().fetchHotels();
    futureRestaurants = RestaurantService().fetchRestaurants();
    print("Futures pour les hôtels et restaurants initialisés.");
  }

  void _showHotelDetails(BuildContext context, String hotelName) {
    print("Affichage des détails pour l'hôtel: $hotelName");
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          height: 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                hotelName,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Détails supplémentaires peuvent être ajoutés ici.',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showRestaurantDetails(BuildContext context, String restaurantName) {
    print("Affichage des détails pour le restaurant: $restaurantName");
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          height: 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                restaurantName,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Détails supplémentaires peuvent être ajoutés ici.',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    print("Construction du widget HotelRestaurantMap...");
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hotels & Restaurants Map'),
      ),
      body: Stack(
        children: [
          FutureBuilder<List<Hotel>>(
            future: futureHotels,
            builder: (context, hotelSnapshot) {
              print("Chargement des hôtels...");
              return FutureBuilder<List<Restaurant>>(
                future: futureRestaurants,
                builder: (context, restaurantSnapshot) {
                  print("Chargement des restaurants...");
                  if (hotelSnapshot.connectionState == ConnectionState.waiting ||
                      restaurantSnapshot.connectionState == ConnectionState.waiting) {
                    print("Chargement en cours...");
                    return const Center(child: CircularProgressIndicator());
                  } else if (hotelSnapshot.hasError || restaurantSnapshot.hasError) {
                    print("Erreur : ${hotelSnapshot.error ?? restaurantSnapshot.error}");
                    return Center(child: Text('Erreur : ${hotelSnapshot.error ?? restaurantSnapshot.error}'));
                  }

                  List<Hotel> hotels = hotelSnapshot.data ?? [];
                  List<Restaurant> restaurants = restaurantSnapshot.data ?? [];
                  print("Hôtels et restaurants chargés. Nombre d'hôtels: ${hotels.length}, Nombre de restaurants: ${restaurants.length}");

                  return FlutterMap(
                    options: MapOptions(
                      // initialCenter: LatLng(48.875, 2.306),
                      initialCenter: LatLng(48.8566, 2.34),
                      initialZoom: 12.0,
                    ),
                    children: [
                      TileLayer(
                        urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                        subdomains: const ['a', 'b', 'c'],
                      ),
                      if (showHotels)
                        MarkerLayer(
                          markers: hotels.map((hotel) {
                            print("Ajout d'un marqueur pour l'hôtel : ${hotel.name}");
                            Color pinColor;
                            IconData pinIcon;

                            if (hotel.status == 'non acquis') {
                              pinColor = Colors.red;
                            } else if(hotel.status == 'acquis') {
                              pinColor = Colors.green;
                            }else {
                              pinColor = Colors.orange;
                            }

                            if (hotel.type == 'hôtel') {
                              pinIcon = Icons.hotel;
                            } else if (hotel.type == 'chambre d\'hôtes') {
                              pinIcon = Icons.home;
                            } else {
                              pinIcon = Icons.apartment;
                            }

                            return Marker(
                              point: LatLng(hotel.latitude, hotel.longitude),
                              width: 40.0,
                              height: 40.0,
                              child: GestureDetector(
                                onTap: () => _showHotelDetails(context, hotel.name),
                                child: Icon(pinIcon, color: pinColor, size: 40),
                              ),
                            );
                          }).toList(),
                        ),
                      if (showRestaurants)
                        MarkerLayer(
                          markers: restaurants.map((restaurant) {
                            print("Ajout d'un marqueur pour le restaurant : ${restaurant.name}, Public: ${restaurant.color}");                            Color forkColor;
                            switch (restaurant.color) {
                              case 0:
                                forkColor = Colors.black;
                                break;
                              case 1:
                                forkColor = Colors.blue;
                                break;
                              case 2:
                                forkColor = Colors.yellow;
                                break;
                              default:
                                forkColor = Colors.grey;
                                break;
                            }

                            return Marker(
                              point: LatLng(restaurant.latitude, restaurant.longitude),
                              width: 40.0,
                              height: 40.0,
                              child: GestureDetector(
                                onTap: () => _showRestaurantDetails(context, restaurant.name),
                                child: Icon(Icons.restaurant, color: forkColor, size: 40),
                              ),
                            );
                          }).toList(),
                        ),
                    ],
                  );
                },
              );
            },
          ),
          Positioned(
            bottom: 16,
            right: 16,
            child: Column(
              children: [
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      showHotels = !showHotels;
                      print("Affichage des hôtels basculé à : $showHotels");
                    });
                  },
                  child: Icon(showHotels ? Icons.hotel : Icons.hotel_outlined),
                ),
                const SizedBox(height: 8),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      showRestaurants = !showRestaurants;
                      print("Affichage des restaurants basculé à : $showRestaurants");
                    });
                  },
                  child: Icon(showRestaurants ? Icons.restaurant : Icons.restaurant_outlined),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

