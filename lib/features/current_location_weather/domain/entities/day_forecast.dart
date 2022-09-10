import 'package:equatable/equatable.dart';
import 'package:weather_app/features/current_location_weather/domain/entities/day_weather.dart';
import 'package:weather_app/features/current_location_weather/domain/entities/hour_weather.dart';
import 'package:weather_app/features/current_location_weather/domain/entities/location_astro.dart';

class DayForecast extends Equatable {
  const DayForecast({
    this.date,
    this.dayWeather,
    this.locationAstro,
    this.hoursWeather,
  });

  final String? date;
  final DayWeather? dayWeather;
  final LocationAstro? locationAstro;
  final List<HourWeather>? hoursWeather;

  Map<String , dynamic> toJson()=>{};

  @override
  List<Object?> get props => [
        date,
        dayWeather,
        locationAstro,
        hoursWeather,
      ];

}
