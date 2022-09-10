import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/core/shared/constants.dart';
import 'package:weather_app/features/current_location_weather/domain/entities/data.dart';
import 'package:weather_app/features/current_location_weather/domain/usecases/get_all_data.dart';

part 'current_weather_events.dart';

part 'current_weather_states.dart';

class CurrentWeatherBloc
    extends Bloc<CurrentWeatherEvent, CurrentWeatherState> {
  final GetCurrentWeatherUseCase getCurrentWeather;
  CurrentWeatherBloc({required this.getCurrentWeather}) : super(CurrentWeatherInitialState()) {
   on<CurrentWeatherEvent>((event , emit)async{
     if(event is GetCurrentWeatherEvent){
       emit(CurrentWeatherLoadingState());
       final failureOrData = await getCurrentWeather();
       failureOrData.fold((failure){
         emit(CurrentWeatherErrorState(error: mapFailureToString(failure)));
       }, (data){
         emit(CurrentWeatherLoadedState(currentlocationData: data));
       });
     }else if(event is RefreshCurrentWeatherEvent){
       emit(CurrentWeatherLoadingState());
       final failureOrData = await getCurrentWeather();
       failureOrData.fold((failure){
         emit(CurrentWeatherErrorState(error: mapFailureToString(failure)));
       }, (weather){
         emit(CurrentWeatherLoadedState(currentlocationData: weather));
       });
     }
   });
  }
}