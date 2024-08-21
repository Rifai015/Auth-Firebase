part of 'wisata_cubit.dart';

sealed class WisataState extends Equatable {
  const WisataState();

  @override
  List<Object> get props => [];
}

final class WisataInitial extends WisataState {}

final class WisataLoading extends WisataState {}

final class WisataSucces extends WisataState {
  final List<WisataModels> wisata;
  const WisataSucces(
    this.wisata,
  );
  @override
  List<Object> get props => [
        wisata,
      ];
}

final class WisataFailed extends WisataState {
  final String error;
  const WisataFailed(
    this.error,
  );
  @override
  List<Object> get props => [
        error,
      ];
}
