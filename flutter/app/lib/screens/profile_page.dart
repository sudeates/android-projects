import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfilePage extends StatelessWidget {
  final String userUID;

  const ProfilePage({Key? key, required this.userUID}) : super(key: key);

  Future<DocumentSnapshot> getUserData() async {
    try {
      DocumentSnapshot doc = await FirebaseFirestore.instance.collection('users').doc(userUID).get();
      print("Fetched user data: ${doc.data()}"); // Log the fetched data
      return doc;
    } catch (e) {
      print('Error fetching user data: $e');
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: getUserData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || !snapshot.data!.exists) {
            return const Center(child: Text('User not found'));
          }

          var userData = snapshot.data!.data() as Map<String, dynamic>;

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Profile header
                  Center(
                    child: Column(
                      children: [
                        const CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage('lib/assets/images/cafe.jpg'), // Replace with your profile image asset
                        ),
                        const SizedBox(height: 10),
                        Text(
                          userData['name'] ?? 'N/A',
                          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          userData['email'] ?? 'N/A',
                          style: const TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Divider(),

                  // Personal Information section
                  const Text(
                    "Personal Information",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  ListTile(
                    leading: const Icon(Icons.person),
                    title: const Text("Name"),
                    subtitle: Text(userData['name'] ?? 'N/A'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.email),
                    title: const Text("Email"),
                    subtitle: Text(userData['email'] ?? 'N/A'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.phone),
                    title: const Text("Phone"),
                    subtitle: Text(userData['phone'] ?? 'N/A'),
                  ),
                  const SizedBox(height: 20),
                  const Divider(),

                  // Travel History section (example static data)
                  const Text(
                    "Travel History",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const ListTile(
                    leading: Icon(Icons.flight),
                    title: Text("New York City"),
                    subtitle: Text("Visited on: 2023-06-15"),
                  ),
                  const ListTile(
                    leading: Icon(Icons.hotel),
                    title: Text("Paris"),
                    subtitle: Text("Stayed on: 2023-04-20"),
                  ),
                  const ListTile(
                    leading: Icon(Icons.beach_access),
                    title: Text("Maldives"),
                    subtitle: Text("Vacation on: 2023-02-10"),
                  ),
                  const SizedBox(height: 20),
                  const Divider(),

                  // Favorites section (example static data)
                  const Text(
                    "Favorites",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const ListTile(
                    leading: Icon(Icons.favorite),
                    title: Text("Rome"),
                    subtitle: Text("Favorite city"),
                  ),
                  const ListTile(
                    leading: Icon(Icons.favorite),
                    title: Text("Tokyo"),
                    subtitle: Text("Favorite destination"),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
