import 'package:equatable/equatable.dart';

class WisataModels extends Equatable {
  final String? title;
  final String? address;
  final String? image;
  final String? deskripsi;

  const WisataModels({
    this.title,
    this.address,
    this.image,
    this.deskripsi,
  });
  @override
  List<Object?> get props => [
        title,
        address,
        image,
        deskripsi,
      ];
// factory digunkaan untuk membuat factory konstruktor yg tidak selalu membuat objek baru.

  factory WisataModels.fromJson(Map<String, dynamic> json) => WisataModels(
        title: json["title"],
        address: json["address"],
        image: json["image"],
        deskripsi: json["deskripsi"], 
      );
}
