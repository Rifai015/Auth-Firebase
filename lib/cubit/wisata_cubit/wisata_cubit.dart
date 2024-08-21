import 'package:auth_firebase/models/wisata_models.dart';
import 'package:auth_firebase/service/wisata_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'wisata_state.dart';

class WisataCubit extends Cubit<WisataState> {
  WisataCubit() : super(WisataInitial());
  List<WisataModels> _allWista = [];

  void getWisata() async {
    try {
      emit(
        WisataLoading(),
      );
      _allWista = await WisataService().getWisata();
      emit(
        WisataSucces(
          _allWista,
        ),
      );
    } catch (e) {
      emit(
        WisataFailed(
          e.toString(),
        ),
      );
    }
  }

  void fillterWisata(
    String query,
  ) async {
    try {
      emit(
        WisataLoading(),
      );
      if (query.isEmpty) {
        emit(
          WisataSucces(
            _allWista,
          ),
        );
      } else {
        List<WisataModels> searchWisata = _allWista.where((map) {
          return map.title!.toLowerCase().contains(
                query.toLowerCase(),
              );
        }).toList();
        emit(
          WisataSucces(
            searchWisata,
          ),
        );
      }
    } catch (e) {
      emit(
        WisataFailed(
          e.toString(),
        ),
      );
    }
  }
}
