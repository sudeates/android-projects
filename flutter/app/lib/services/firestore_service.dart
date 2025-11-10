import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:app/model/place_model.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<PlaceInfo>> searchPlaces(String query) async {
    try {
      final result = await _db.collection('places')
          .where('name', isGreaterThanOrEqualTo: query)
          .where('name', isLessThanOrEqualTo: query + '\uf8ff')
          .get();

      return result.docs.map((doc) => PlaceInfo.fromFirestore(doc)).toList();
    } catch (e) {
      print("Error searching places: $e");
      return [];
    }
  }
}


