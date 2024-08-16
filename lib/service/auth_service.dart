import 'package:auth_firebase/models/user_models.dart';
import 'package:auth_firebase/service/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<UserModels> signUp({
    required String name,
    required String email,
    required String password,
    required String jurusan,
   }) async {
    try {
      UserCredential userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      UserModels user = UserModels(
        id: userCredential.user!.uid,
        email: email,
        password: password,
        name: name,
        jurusan: jurusan,
      );
      await UserService().dataUser(
        user,
      );
      return user;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<UserModels> signIn({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential =
          await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      UserModels user = await UserService().dataId(
        userCredential.user!.uid,
      );
      await UserService().dataUser(
        user,
      );
      return user;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> signOut() async {
    try {
      await firebaseAuth.signOut();
    } catch (e) {
      throw e.toString();
    }
  }
}
