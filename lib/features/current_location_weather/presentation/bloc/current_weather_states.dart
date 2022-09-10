part of 'current_weather_bloc.dart';

abstract class CurrentWeatherState extends Equatable {
  const CurrentWeatherState();

  @override
  List<Object?> get props => [];
}

class CurrentWeatherInitialState extends CurrentWeatherState {}

class CurrentWeatherLoadingState extends CurrentWeatherState {}

class CurrentWeatherLoadedState extends CurrentWeatherState {
  const CurrentWeatherLoadedState({required this.currentlocationData});

  final Data currentlocationData;

  @override
  List<Object?> get props => [];
}

class CurrentWeatherErrorState extends CurrentWeatherState {
  const CurrentWeatherErrorState({required this.error});

  final String error;

  @override
  List<Object?> get props => [];
}
