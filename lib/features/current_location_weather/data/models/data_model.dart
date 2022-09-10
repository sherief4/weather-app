import 'package:weather_app/features/current_location_weather/data/models/current_weather_model.dart';
import 'package:weather_app/features/current_location_weather/data/models/forecast_model.dart';
import 'package:weather_app/features/current_location_weather/data/models/location_model.dart';
import 'package:weather_app/features/current_location_weather/domain/entities/data.dart';

class DataModel extends Data {
  const DataModel({
    final LocationModel? location,
    final CurrentWeatherModel? currentWeather,
    final ForecastModel? forecast,
  }) : super(
          location: location,
          currentWeather: currentWeather,
          daysForecast: forecast,
        );

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      location: LocationModel.fromJson(json['location']),
      currentWeather: CurrentWeatherModel.fromJson(json['current']),
      forecast: ForecastModel.fromJson(json['forecast']),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'location': location!.toJson(),
      'current': currentWeather!.toJson(),
      'forecast': daysForecast!.toJson(),
    };
  }
}
