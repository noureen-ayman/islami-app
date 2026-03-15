import '../models/radio/Radio_model.dart';
import '../models/reciters/Reciters_model.dart';

abstract class RadioRemoteDataSource {
  Future<RadioModel> getRadioData();

  Future<RecitersModel> getReciterData();
}
