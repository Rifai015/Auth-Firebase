import 'package:auth_firebase/models/user_models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection(
    "user",
  );

  Future<void> dataUser(
    UserModels user,
  ) async {
    try {
      collectionReference
          .doc(
        user.id,
      )
          .set({
        "name": user.name,
        "email": user.email,
        "jurusan": user.jurusan,
      });
    } catch (e) {
      throw e.toString();
    }
  }

  Future<UserModels> dataId(
    String id,
  ) async {
    try {
      DocumentSnapshot documentSnapshot =
          await collectionReference.doc(id).get();
      return UserModels(
        id: id,
        name: documentSnapshot["name"],
        email: documentSnapshot["email"],
        jurusan: documentSnapshot["jurusan"],
      );
    } catch (e) {
      throw e.toString();
    }
  }
}
