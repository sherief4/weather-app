import 'package:equatable/equatable.dart';
import 'package:weather_app/features/current_location_weather/domain/entities/condition.dart';

class CurrentWeather extends Equatable {
  const CurrentWeather({
    this.lastUpdated,
    this.temp,
    this.condition,
    this.windSpeed,
    this.windDegree,
    this.windDirection,
    this.pressure,
    this.humidity,
    this.feelsLike,
    this.uv,
    this.isDay,
  });

  final String? lastUpdated;
  final double? temp;
  final Condition? condition;
  final double? windSpeed;
  final int? windDegree;
  final String? windDirection;
  final double? pressure;
  final int? humidity;
  final double? feelsLike;
  final double? uv;
  final int? isDay;

  Map<String, dynamic> toJson() => {};

  @override
  List<Object?> get props => [
        lastUpdated,
        temp,
        condition,
        windSpeed,
        windDegree,
        windDirection,
        pressure,
        humidity,
        feelsLike,
        uv,
        isDay,
      ];
}
