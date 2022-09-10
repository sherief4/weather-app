import 'package:dartz/dartz.dart';
import 'package:weather_app/core/errors/failures.dart';
import 'package:weather_app/features/current_location_weather/domain/entities/data.dart';
import 'package:weather_app/features/current_location_weather/domain/repositories/data_repository.dart';

class GetCurrentWeatherUseCase {
  GetCurrentWeatherUseCase({required this.currentWeatherRepository});

  final DataRepository currentWeatherRepository;

  Future<Either<Failure, Data>> call() async {
    return await currentWeatherRepository.getAllData();
  }
}
