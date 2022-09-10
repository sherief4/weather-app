import 'package:weather_app/features/current_location_weather/data/models/day_weather_model.dart';
import 'package:weather_app/features/current_location_weather/data/models/hour_weather_model.dart';
import 'package:weather_app/features/current_location_weather/data/models/location_astro_model.dart';
import 'package:weather_app/features/current_location_weather/domain/entities/day_forecast.dart';

class DayForecastModel extends DayForecast {
  const DayForecastModel({
    final String? date,
    final DayWeatherModel? dayWeather,
    final LocationAstroModel? locationAstro,
    final List<HourWeatherModel>? hoursWeather,
  }) : super(
    date: date,
    dayWeather: dayWeather,
    locationAstro: locationAstro,
    hoursWeather: hoursWeather,
  );

  factory DayForecastModel.fromJson(Map<String, dynamic> json) {
    List<HourWeatherModel> hours = [];
    if (json['hour'] != null) {
      for (var element in json['hour']) {
        hours.add(HourWeatherModel.fromJson(element));
      }
    }
    return DayForecastModel(
      date: json['date'],
      dayWeather: DayWeatherModel.fromJson(json['day']),
      locationAstro: LocationAstroModel.fromJson(json['astro']),
      hoursWeather: hours,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'day': dayWeather!.toJson(),
      'astro': locationAstro!.toJson(),
      'hour': hoursWeather!.map((e) => e.toJson()).toList(),
    };
  }
}
