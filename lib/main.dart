import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/core/dependency/injection_container.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/current_location_weather/presentation/bloc/current_weather_bloc.dart';
import 'package:weather_app/features/current_location_weather/presentation/pages/landing/landing_page.dart';
import 'package:weather_app/features/manage_locations/presentation/cubit/cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => di.sl<CurrentWeatherBloc>()
              ..add(
                GetCurrentWeatherEvent(),
              ),
          ),
          BlocProvider(
            create: (_) => di.sl<LocationCubit>()..getFavouriteLocations(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Weather App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const LandingPage(),
        ));
  }
}
