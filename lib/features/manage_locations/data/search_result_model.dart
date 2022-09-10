import 'package:weather_app/features/current_location_weather/data/models/current_weather_model.dart';
import 'package:weather_app/features/current_location_weather/data/models/location_model.dart';

class SearchResultModel {
  const SearchResultModel({this.currentWeather, this.location});

  final CurrentWeatherModel? currentWeather;
  final LocationModel? location;

  factory SearchResultModel.fromJson(Map<String, dynamic> json) {
    return SearchResultModel(
      currentWeather: CurrentWeatherModel.fromJson(json['current']),
      location: LocationModel.fromJson(json['location']),
    );
  }
}
