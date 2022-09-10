import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/core/network/network_info.dart';
import 'package:weather_app/features/current_location_weather/data/datasources/local_data_source.dart';
import 'package:weather_app/features/current_location_weather/data/datasources/remote_data_source.dart';
import 'package:weather_app/features/current_location_weather/data/repositories/data_repository_impl.dart';
import 'package:weather_app/features/current_location_weather/domain/repositories/data_repository.dart';
import 'package:weather_app/features/current_location_weather/domain/usecases/get_all_data.dart';
import 'package:weather_app/features/current_location_weather/presentation/bloc/current_weather_bloc.dart';
import 'package:weather_app/features/manage_locations/presentation/cubit/cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //Bloc
  sl.registerFactory(() => CurrentWeatherBloc(getCurrentWeather: sl()));
  sl.registerFactory(() => LocationCubit(sharedPreferences: sl()));

  //Use Cases
  sl.registerLazySingleton(
      () => GetCurrentWeatherUseCase(currentWeatherRepository: sl()));

  //Repositories
  sl.registerLazySingleton<DataRepository>(
    () => DataRepositoryImpl(
      networkInfo: sl(),
      remoteDataSource: sl(),
      localDataSource: sl(),
    ),
  );

  //Data Sources
  sl.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<LocalDataSource>(
      () => LocalDataSourceImpl(sharedPreferences: sl()));

  //Network Info
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //Shared preferences
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

  //http
  sl.registerLazySingleton(() => http.Client());

  //Internet Connection Checker
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
