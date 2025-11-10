import 'package:cloud_firestore/cloud_firestore.dart';

class PlaceInfo {
  final String location, image, name, desc;
  final int distance, days;

  PlaceInfo({
    required this.desc,
    required this.name,
    required this.image,
    required this.location,
    required this.distance,
    required this.days,
  });

  factory PlaceInfo.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return PlaceInfo(
      desc: data['desc'] ?? '',
      name: data['name'] ?? '',
      image: data['image'] ?? '',
      location: data['location'] ?? '',
      distance: data['distance'] ?? 0,
      days: data['days'] ?? 0,
    );
  }
}

List<PlaceInfo> places = [
  PlaceInfo(
    image: 'lib/assets/images/Chittorgarh-Fort-India.jpeg',
    location: 'India',
    name: 'Chittorgarh Fort',
    distance: 50000,
    days: 12,
    desc: "This 590 foot high fort spread across 692 acres is the largest fort in India and a World Heritage Site.This 590 foot high fort spread across 692 acres is the largest fort in India and a World Heritage Site.",
  ),
  PlaceInfo(
    image: 'lib/assets/images/Cinque-Terre-Italy.jpeg',
    location: 'Italy',
    name: 'Cinque Terre',
    distance: 22500,
    days: 7,
    desc: "Cinque Terre literally means 'Five Lands', and consists of 5 villages located across the rugged hillside.Cinque Terre literally means 'Five Lands', and consists of 5 villages located across the rugged hillside.",
  ),
  PlaceInfo(
    image: 'lib/assets/images/Galapagos-Islands.jpeg',
    location: 'Ireland',
    name: 'Galapagos Islands',
    distance: 47000,
    days: 22,
    desc: "Named one of the natural wonders of the UK, the Giant's Causeway is an area with about 40,000 interlocking basalt columns.Named one of the natural wonders of the UK, the Giant's Causeway is an area with about 40,000 interlocking basalt columns.",
  ),
  PlaceInfo(
    image: 'lib/assets/images/Kyoto-Japan.jpeg',
    location: 'Japan',
    name: 'Kyoto',
    distance: 17000,
    days: 15,
    desc: "Kyoto is one of the most favourite Japanese cities for tourists. From the iconic temples, palaces, bamboo groves, and traditional wooden houses.Kyoto is one of the most favourite Japanese cities for tourists. From the iconic temples, palaces, bamboo groves, and traditional wooden houses",
  ),
];
