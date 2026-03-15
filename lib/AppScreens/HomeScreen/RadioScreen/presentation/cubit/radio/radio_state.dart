import '../../../data/models/radio/Radios.dart';

abstract class RadioState {}

class RadioInitialState extends RadioState {}

class RadioLoadingState extends RadioState {}

class RadioErrorState extends RadioState {
  final String errorMessage;

  RadioErrorState(this.errorMessage);
}

class RadioSuccessState extends RadioState {
  final List<Radios> radios;

  RadioSuccessState(this.radios);
}

class RadioPlayerState extends RadioState {
  final int playingIndex;

  RadioPlayerState(this.playingIndex);
}
