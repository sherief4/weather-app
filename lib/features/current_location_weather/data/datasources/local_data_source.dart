import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/core/errors/exceptions.dart';
import 'package:weather_app/core/strings/end_points.dart';
import 'package:weather_app/features/current_location_weather/data/models/data_model.dart';

abstract class LocalDataSource {
  Future<DataModel> getCachedData();

  Future<Unit> cacheData({required DataModel dataModel});
}

class LocalDataSourceImpl implements LocalDataSource {
  LocalDataSourceImpl({required this.sharedPreferences});

  final SharedPreferences sharedPreferences;

  @override
  Future<Unit> cacheData({required DataModel dataModel}) {
    sharedPreferences.setString(
        CACHE_CURRENT_WEATHER, json.encode(dataModel.toJson()));
    return Future.value(unit);
  }

  @override
  Future<DataModel> getCachedData() {
    final jsonString = sharedPreferences.getString(CACHE_CURRENT_WEATHER);
    if (jsonString != null) {
      Map<String, dynamic> decodedJsonData = json.decode(jsonString);
      DataModel model = DataModel.fromJson(decodedJsonData);
      return Future.value(model);
    } else {
      throw EmptyCacheException();
    }
  }
}
