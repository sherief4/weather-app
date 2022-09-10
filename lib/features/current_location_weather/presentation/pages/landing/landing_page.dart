import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/widgets/error_display.dart';
import 'package:weather_app/core/widgets/loading_widget.dart';
import 'package:weather_app/features/current_location_weather/presentation/bloc/current_weather_bloc.dart';
import 'package:weather_app/features/current_location_weather/presentation/pages/home/home_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentWeatherBloc, CurrentWeatherState>(
        builder: (context, state) {
      if (state is CurrentWeatherLoadingState) {
        return const LoadingWidget();
      } else if (state is CurrentWeatherLoadedState) {
        return HomePage(
          currentWeather: state.currentlocationData,
        );
      } else if (state is CurrentWeatherErrorState) {
        return ErrorDisplayWidget(
          message: state.error,
        );
      }
      return const ErrorDisplayWidget(message: 'Error, please try again');
    });
  }
}
