import 'package:auth_firebase/models/user_models.dart';
import 'package:auth_firebase/service/auth_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void signUp({
    required String email,
    required String password,
    required String name,
    required String jurusan,
  }) async {
    try {
      emit(
        AuthLoading(),
      );
      UserModels user = await AuthService().signUp(
        name: name,
        email: email,
        password: password,
        jurusan: jurusan,
      );
      emit(
        AuthSucces(
          user,
        ),
      );
    } catch (e) {
      emit(
        AuthFailed(
          e.toString(),
        ),
      );
    }
  }

  void signIn({
    required String email,
    required String password,
  }) async {
    try {
      emit(
        AuthLoading(),
      );
      UserModels user = await AuthService().signIn(
        email: email,
        password: password,
      );
      emit(AuthSucces(user));
    } catch (e) {
      emit(
        AuthFailed(
          e.toString(),
        ),
      );
    }
  }

  void signOut() async {
    try {
      emit(
        AuthLoading(),
      );
      await AuthService().signOut();
      emit(
        AuthInitial(),
      );
    } catch (e) {
      emit(
        AuthFailed(
          e.toString(),
        ),
      );
    }
  }
}
