import 'package:weather_app/features/current_location_weather/data/models/condition_model.dart';
import 'package:weather_app/features/current_location_weather/domain/entities/day_weather.dart';

class DayWeatherModel extends DayWeather {
  const DayWeatherModel({
    final double? minTemp,
    final double? maxTemp,
    final ConditionModel? condition,
    final double? uv,
    final double? humidity,
  }) : super(
          minTemp: minTemp,
          maxTemp: maxTemp,
          condition: condition,
          uv: uv,
          humidity: humidity,
        );

  factory DayWeatherModel.fromJson(Map<String, dynamic> json) {
    return DayWeatherModel(
      minTemp: json['mintemp_c'],
      maxTemp: json['maxtemp_c'],
      condition: ConditionModel.fromJson(json['condition']),
      uv: json['uv'],
      humidity: json['avghumidity'],
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        'mintemp_c': minTemp,
        'maxtemp_c': maxTemp,
        'condition': condition!.toJson(),
        'uv': uv,
        'avghumidity': humidity,
      };
}
