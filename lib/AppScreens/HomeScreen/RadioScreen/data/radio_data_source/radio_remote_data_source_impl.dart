import 'package:dio/dio.dart';
import 'package:islami/AppScreens/HomeScreen/RadioScreen/data/models/radio/Radio_model.dart';
import 'package:islami/AppScreens/HomeScreen/RadioScreen/data/radio_data_source/radio_remote_data_source.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../models/reciters/Reciters_model.dart';

class RadioRemoteDataSourceImpl implements RadioRemoteDataSource {
  final Dio _dio;

  RadioRemoteDataSourceImpl()
    : _dio = Dio()
        ..interceptors.add(
          PrettyDioLogger(
            requestHeader: true,
            requestBody: true,
            responseBody: true,
            responseHeader: true,
            error: true,
          ),
        );

  @override
  Future<RadioModel> getRadioData() async {
    try {
      final response = await _dio.get(
        'https://mp3quran.net/api/v3/radios?language=eng',
      );
      if (response.statusCode == 200) {
        return RadioModel.fromJson(response.data);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to load data');
    }
  }

  @override
  Future<RecitersModel> getReciterData() async {
    try {
      final response = await _dio.get(
        'https://www.mp3quran.net/api/v3/reciters?language=eng',
      );
      if (response.statusCode == 200) {
        return RecitersModel.fromJson(response.data);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to load data');
    }
  }
}
