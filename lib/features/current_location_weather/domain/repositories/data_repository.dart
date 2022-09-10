import 'package:dartz/dartz.dart';
import 'package:weather_app/core/errors/failures.dart';
import 'package:weather_app/features/current_location_weather/domain/entities/data.dart';

abstract class DataRepository {
 Future<Either<Failure, Data>> getAllData();
}