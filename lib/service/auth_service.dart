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
      // user credential adalah sebuah objek yang digunakan dalam firebase auth untuk mewakili hasil dari operasi auntentikasi 
      // cth dalam kehidupan sehari-hari ketika kita ingin mendafatar disebuah organisasi, maka pihak organisasi tersebut akan mengasih berkas kepada kita, pastinya berkas tersebut akan dibuat untuk pendaftaran. Maka dari itu usercredential bisa dibilang sebgai berkas laporannnya. 
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
        // tanda ! seru adalah tanda dalam objekdart yg digunakan untuk memaksa sifat null (?) menjadi tidak null
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
