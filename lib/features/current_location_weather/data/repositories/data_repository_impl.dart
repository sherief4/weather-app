import 'package:dartz/dartz.dart';
import 'package:weather_app/core/errors/exceptions.dart';
import 'package:weather_app/core/errors/failures.dart';
import 'package:weather_app/core/network/network_info.dart';
import 'package:weather_app/features/current_location_weather/data/datasources/local_data_source.dart';
import 'package:weather_app/features/current_location_weather/data/datasources/remote_data_source.dart';
import 'package:weather_app/features/current_location_weather/domain/entities/data.dart';
import 'package:weather_app/features/current_location_weather/domain/repositories/data_repository.dart';

class DataRepositoryImpl extends DataRepository {
  DataRepositoryImpl({
    required this.networkInfo,
    required this.remoteDataSource,
    required this.localDataSource,

  });

  final RemoteDataSource remoteDataSource;

  final LocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, Data>> getAllData() async {
    if (await networkInfo.isConnected) {
      try {

        final remoteWeatherData =
            await remoteDataSource.getRemoteCurrentWeather();
        await localDataSource.cacheData(
          dataModel: remoteWeatherData,
        );
        return Right(remoteWeatherData);
      } on ApiException {
        return Left(ApiFailure());
      }
    } else {
      try {
        final localWeatherData = await localDataSource.getCachedData();
        return Right(localWeatherData);
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    }
  }
}
