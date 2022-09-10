import 'package:weather_app/features/current_location_weather/data/models/condition_model.dart';
import 'package:weather_app/features/current_location_weather/domain/entities/hour_weather.dart';

class HourWeatherModel extends HourWeather {
  const HourWeatherModel({
    final String? dateTime,
    final double? temp,
    final ConditionModel? condition,
    final double? windSpeed,
    final String? windDirection,
    final double? pressure,
    final int? humidity,
    final double? uv,
    final double? feelsLike,
    final int? isDay,
  }) : super(
          dateTime: dateTime,
          temp: temp,
          uv: uv,
          condition: condition,
          windSpeed: windSpeed,
          windDirection: windDirection,
          humidity: humidity,
          isDay: isDay,
          feelsLike: feelsLike,
        );

  factory HourWeatherModel.fromJson(Map<String, dynamic> json) {
    return HourWeatherModel(
      dateTime: json['time'],
      temp: json['temp_c'],
      condition: ConditionModel.fromJson(json['condition']),
      windSpeed: json['wind_kph'],
      windDirection: json['wind_dir'],
      humidity: json['humidity'],
      uv: json['uv'],
      feelsLike: json['feelslike_c'],
      isDay: json['is_day'],
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        'time': dateTime,
        'temp_c': temp,
        'condition': condition!.toJson(),
        'wind_kph': windSpeed,
        'wind_dir': windDirection,
        'humidity': humidity,
        'uv': uv,
        'feelslike_c': feelsLike,
        'is_day': isDay,
      };
}
