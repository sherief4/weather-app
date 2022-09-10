import 'package:weather_app/features/current_location_weather/data/models/condition_model.dart';
import 'package:weather_app/features/current_location_weather/domain/entities/current_weather.dart';

class CurrentWeatherModel extends CurrentWeather {
  const CurrentWeatherModel(
      {String? lastUpdated,
      double? temp,
      ConditionModel? condition,
      double? windSpeed,
      int? windDegree,
      String? windDirection,
      double? pressure,
      int? humidity,
      double? feelsLike,
      int? isDay,
      double? uv})
      : super(
          lastUpdated: lastUpdated,
          temp: temp,
          condition: condition,
          windSpeed: windSpeed,
          windDegree: windDegree,
          windDirection: windDirection,
          pressure: pressure,
          humidity: humidity,
          feelsLike: feelsLike,
          uv: uv,
          isDay: isDay,
        );

  factory CurrentWeatherModel.fromJson(Map<String, dynamic> json) {
    return CurrentWeatherModel(
      lastUpdated: json['last_updated'],
      temp: json['temp_c'],
      condition: ConditionModel.fromJson(json['condition']),
      windSpeed: json['wind_kph'],
      windDegree: json['wind_degree'],
      windDirection: json['wind_dir'],
      pressure: json['pressure_in'],
      humidity: json['humidity'],
      feelsLike: json['feelslike_c'],
      uv: json['uv'],
      isDay: json['is_day'],
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        "last_updated": lastUpdated,
        'temp_c': temp,
        'condition': condition!.toJson(),
        'wind_kph': windSpeed,
        'wind_dir': windDirection,
        'wind_degree': windDegree,
        'pressure_in': pressure,
        'humidity': humidity,
        'feelslike_c': feelsLike,
        'uv': uv,
        'is_day': isDay,
      };
}
