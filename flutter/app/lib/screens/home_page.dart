import 'package:app/compenents/categorycard.dart';
import 'package:app/compenents/recommended_card.dart';
import 'package:app/screens/detail_screen.dart';
import 'package:app/screens/profile_page.dart';
import 'package:app/services/firestore_service.dart';
import 'package:app/model/place_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  List<PlaceInfo> _searchResults = [];

  void _searchPlaces(String query) async {
    if (query.isNotEmpty) {
      FirestoreService firestoreService = FirestoreService();
      List<PlaceInfo> results = await firestoreService.searchPlaces(query);
      setState(() {
        _searchResults = results;
      });
    } else {
      setState(() {
        _searchResults = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;
    final String userUID = user?.uid ?? '';

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 199, 211, 224),
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: signUserOut,
            icon: const Icon(Icons.logout),
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.account_circle_rounded),
          onPressed: () {
            if (userUID.isNotEmpty) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilePage(userUID: userUID),
                ),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('User is not signed in.'),
                ),
              );
            }
          },
        ),
        title: const Center(
          child: Text(
            "Travel App",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  const Center(
                    child: Text(
                      "Explore new destinations",
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Material(
                      borderRadius: BorderRadius.circular(100),
                      elevation: 5,
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: _searchController,
                                  decoration: const InputDecoration(
                                    hintText: "Search your destination",
                                    prefixIcon: Icon(
                                      Icons.search,
                                      color: Colors.blue,
                                    ),
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                  ),
                                  onChanged: _searchPlaces,
                                ),
                              ),
                              const CircleAvatar(
                                radius: 22,
                                backgroundColor: Color.fromARGB(255, 241, 241, 241),
                                child: Icon(
                                  Icons.sort_by_alpha_sharp,
                                  color: Colors.blue,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  _searchResults.isNotEmpty
                      ? ListView.builder(
                          shrinkWrap: true,
                          itemCount: _searchResults.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(_searchResults[index].name),
                              subtitle: Text(_searchResults[index].desc),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailScreen(placeInfo: _searchResults[index]),
                                  ),
                                );
                              },
                            );
                          },
                        )
                      : Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 15),
                              child: Row(
                                children: [
                                  Text(
                                    "Categories",
                                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Container(
                                height: 55,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    CategoryCard(
                                      title: "Cafe",
                                      image: "lib/assets/images/cafe.jpg",
                                      press: () {},
                                    ),
                                    CategoryCard(
                                      title: "Hotel",
                                      image: "lib/assets/images/otel.jpg",
                                      press: () {},
                                    ),
                                    CategoryCard(
                                      title: "History",
                                      image: "lib/assets/images/historical.jpg",
                                      press: () {},
                                    ),
                                    CategoryCard(
                                      title: "Beach",
                                      image: "lib/assets/images/beach.jpg",
                                      press: () {},
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Padding(
                              padding: EdgeInsets.only(left: 15),
                              child: Row(
                                children: [
                                  Text(
                                    "Recommended",
                                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              height: 300,
                              child: ListView.builder(
                                itemCount: places.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        RecommendedCard(
                                          placeInfo: places[index],
                                          press: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => DetailScreen(
                                                  placeInfo: places[index],
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }
}
