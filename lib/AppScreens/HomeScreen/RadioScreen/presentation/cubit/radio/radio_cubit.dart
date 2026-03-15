import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/AppScreens/HomeScreen/RadioScreen/data/radio_data_source/radio_remote_data_source.dart';
import 'package:islami/AppScreens/HomeScreen/RadioScreen/presentation/cubit/radio/radio_state.dart';
import 'package:just_audio/just_audio.dart';

import '../../../data/models/radio/Radios.dart';

class RadioCubit extends Cubit<RadioState> {
  final RadioRemoteDataSource _radioDataSource;

  final AudioPlayer _player = AudioPlayer();

  int playingIndex = -1;
  List<Radios> radios = [];

  RadioCubit(this._radioDataSource) : super(RadioInitialState());

  Future<void> getRadioData() async {
    emit(RadioLoadingState());
    try {
      final response = await _radioDataSource.getRadioData();
      radios = response.radios ?? [];

      emit(RadioSuccessState(response.radios ?? []));
    } catch (e) {
      emit(RadioErrorState(e.toString()));
    }
  }

  Future<void> playRadio(String url, int index) async {
    if (playingIndex == index) {
      await _player.stop();
      playingIndex = -1;
    } else {
      await _player.setUrl(url);
      _player.play();
      playingIndex = index;
    }

    emit(RadioSuccessState(radios));
  }
}
