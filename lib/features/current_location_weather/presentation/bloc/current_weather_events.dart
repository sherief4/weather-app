part of 'current_weather_bloc.dart';

abstract class CurrentWeatherEvent extends Equatable {
  const CurrentWeatherEvent();

  @override
  List<Object?> get props => [];
}

class GetCurrentWeatherEvent extends CurrentWeatherEvent {
  @override
  List<Object?> get props => [];
}

class RefreshCurrentWeatherEvent extends CurrentWeatherEvent {
  @override
  List<Object?> get props => [];
}
