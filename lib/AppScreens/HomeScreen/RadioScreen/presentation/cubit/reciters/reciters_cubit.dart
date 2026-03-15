import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';

import '../../../data/models/reciters/Reciters.dart';
import '../../../data/radio_data_source/radio_remote_data_source.dart';
import 'reciters_state.dart';

class ReciterCubit extends Cubit<ReciterState> {
  final RadioRemoteDataSource dataSource;
  final AudioPlayer _player = AudioPlayer();

  int playingIndex = -1;
  List<Reciters> reciters = [];

  ReciterCubit(this.dataSource) : super(ReciterInitialState());

  Future<void> getReciters() async {
    emit(ReciterLoadingState());
    try {
      final recitersData = await dataSource.getReciterData();
      reciters = recitersData.reciters ?? [];
      emit(ReciterSuccessState(reciters));
    } catch (e) {
      emit(ReciterErrorState(e.toString()));
    }
  }

  Future<void> playReciter(Reciters reciter, int index) async {
    final moshaf = reciter.moshaf?.first;
    if (moshaf == null) return;

    final url = '${moshaf.server}${'002'}.mp3';

    if (playingIndex == index) {
      await _player.stop();
      playingIndex = -1;
    } else {
      await _player.setUrl(url);
      _player.play();
      playingIndex = index;
    }
    emit(ReciterPlayerState(playingIndex));
  }
}
