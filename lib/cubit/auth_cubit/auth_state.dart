part of 'auth_cubit.dart';

// sealed class adalah konsep yang memeastikan semua kelas yang terdapat dalam 
//kelas autstate harus didefinisikan dalam file yg sama 
// Equetable digunakan untuk mempermudah perbandingan objek

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  // autstate akan membuat default kode berupa list dengan tipe data objek
  // list objek adalah sebuah list yang menyimpan semua objek dari berbagai tipe data yang ada 
  // props adalah ketika nila nya sma dengan yang lain maka nilainya bersifat true, jika tidak maka sifatnya bersifat false 
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSucces extends AuthState {
  final UserModels user;
  const AuthSucces(
    this.user,
  );
  @override
  List<Object> get props => [
        user,
      ];
}

final class AuthFailed extends AuthState {
  final String error;
  const AuthFailed(
    this.error,
  );
  @override
  List<Object> get props => [
        error,
      ];
}
