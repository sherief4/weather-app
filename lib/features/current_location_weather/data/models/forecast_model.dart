import 'package:weather_app/features/current_location_weather/data/models/day_forecast_model.dart';
import 'package:weather_app/features/current_location_weather/domain/entities/forecast.dart';

class ForecastModel extends Forecast {
  const ForecastModel({final List<DayForecastModel>? daysForecast})
      : super(daysForecast: daysForecast);

  factory ForecastModel.fromJson(Map<String, dynamic> json) {
    final List<DayForecastModel> days = [];
    if (json['forecastday'] != null) {
      for (var element in json['forecastday']) {
        days.add(DayForecastModel.fromJson(element));
      }
    }
    return ForecastModel(daysForecast: days);
  }

  @override
  Map<String, dynamic> toJson() => {
        'forecastday': daysForecast!.map((e) => e.toJson()).toList(),
      };
}
