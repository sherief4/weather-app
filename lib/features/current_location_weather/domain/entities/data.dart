import 'package:equatable/equatable.dart';
import 'package:weather_app/features/current_location_weather/domain/entities/current_weather.dart';
import 'package:weather_app/features/current_location_weather/domain/entities/forecast.dart';
import 'package:weather_app/features/current_location_weather/domain/entities/location.dart';

class Data extends Equatable {
  const Data({
    this.location,
    this.currentWeather,
    this.daysForecast,
  });

  final Location? location;
  final CurrentWeather? currentWeather;
  final Forecast? daysForecast;

  Map<String, dynamic> toJson() => {};

  @override
  List<Object?> get props => [location, currentWeather, daysForecast];
}
