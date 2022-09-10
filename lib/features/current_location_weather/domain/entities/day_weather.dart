import 'package:equatable/equatable.dart';
import 'package:weather_app/features/current_location_weather/domain/entities/condition.dart';

class DayWeather extends Equatable {
  const DayWeather({this.minTemp, this.maxTemp, this.condition, this.uv, this.humidity});

  final double? minTemp;
  final double? maxTemp;
  final Condition? condition;
  final double? uv;
  final double? humidity;
  Map<String , dynamic> toJson()=>{};
  @override
  List<Object?> get props => [
    minTemp,maxTemp,condition
  ];
}
