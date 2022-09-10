import 'package:equatable/equatable.dart';
import 'package:weather_app/features/current_location_weather/domain/entities/condition.dart';

class HourWeather extends Equatable {
  const HourWeather({
    this.dateTime,
    this.temp,
    this.condition,
    this.windSpeed,
    this.windDirection,
    this.uv,
    this.humidity,
    this.isDay,
    this.feelsLike,
  });

  final String? dateTime;
  final double? temp;
  final double? uv;
  final int? isDay;
  final Condition? condition;
  final double? windSpeed;
  final String? windDirection;
  final int? humidity;
  final double? feelsLike;

  Map<String, dynamic> toJson() => {};

  @override
  List<Object?> get props => [
        dateTime,
        temp,
        uv,
        condition,
        windSpeed,
        isDay,
        windDirection,
        humidity,
        feelsLike,
      ];
}
