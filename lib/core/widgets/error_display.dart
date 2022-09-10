import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/core/shared/constants.dart';
import 'package:weather_app/features/current_location_weather/presentation/bloc/current_weather_bloc.dart';

class ErrorDisplayWidget extends StatelessWidget {
  const ErrorDisplayWidget({Key? key, required this.message}) : super(key: key);
  final String message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: backgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(
          16.0,
        ),
        child: Column(
          children: [
            Center(
              child: Lottie.asset(
                width: 350,
                height: 350,
                "assets/lotties/error.json",
              ),
            ),
            const SizedBox(height: 32.0,),
            Text(message, style: TextStyle(
              color: darkBackgroundColor,
              fontSize: 24.0,
              fontWeight: FontWeight.w400,
            ),)
          ],
        ),
      ),
    );
  }
}
