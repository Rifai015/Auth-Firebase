import 'package:equatable/equatable.dart';

class UserModels extends Equatable {
  final String? id;
  final String? name;
  final String? email;
  final String? password;
  final String? jurusan;

  const UserModels({
    this.id,
    this.name,
    this.email,
    this.password,
    this.jurusan,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        password,
        jurusan,
      ];
}
