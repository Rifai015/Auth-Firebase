import 'package:auth_firebase/models/wisata_models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class WisataService {
  CollectionReference wisata = FirebaseFirestore.instance.collection(
    "wisata",
  );
  Future<List<WisataModels>> getWisata() async {
    try {
      QuerySnapshot querySnapshot = await wisata.get();
      List<WisataModels> list = querySnapshot.docs.map((map) {
        return WisataModels.fromJson(map.data() as Map<String, dynamic>);
      }).toList();
      return list;
    } catch (e) {
      throw e.toString();
    }
  }
}
