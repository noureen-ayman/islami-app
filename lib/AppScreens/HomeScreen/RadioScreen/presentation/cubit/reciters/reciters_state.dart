import 'package:islami/AppScreens/HomeScreen/RadioScreen/data/models/reciters/Reciters.dart';

abstract class ReciterState {}

class ReciterInitialState extends ReciterState {}

class ReciterLoadingState extends ReciterState {}

class ReciterErrorState extends ReciterState {
  final String errorMessage;

  ReciterErrorState(this.errorMessage);
}

class ReciterSuccessState extends ReciterState {
  final List<Reciters> reciters;

  ReciterSuccessState(this.reciters);
}

class ReciterPlayerState extends ReciterState {
  final int playingIndex;

  ReciterPlayerState(this.playingIndex);
}
