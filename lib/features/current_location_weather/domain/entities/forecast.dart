import 'package:equatable/equatable.dart';
import 'package:weather_app/features/current_location_weather/domain/entities/day_forecast.dart';

class Forecast extends Equatable {
  const Forecast({this.daysForecast});

  final List<DayForecast>? daysForecast;

  Map<String, dynamic> toJson() => {};

  @override
  // TODO: implement props
  List<Object?> get props => [daysForecast];
}
