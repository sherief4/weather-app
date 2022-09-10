import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/core/widgets/condition_icon.dart';
import 'package:weather_app/features/current_location_weather/domain/entities/hour_weather.dart';

class VerticalWeatherWidget extends StatelessWidget {
  const VerticalWeatherWidget(
      {Key? key, required this.model, required this.index})
      : super(key: key);
  final HourWeather model;
  final int index;

  @override
  Widget build(BuildContext context) {
    final String date = model.dateTime!.split('2022-')[1].replaceAll('-', '/');
    return Container(
      decoration: BoxDecoration(
        color:
            index == DateTime.now().hour ? Colors.black26 : Colors.transparent,
        borderRadius: BorderRadius.circular(
          10.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 8.0,
          right: 8.0,
          top: 16.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              date.split(' ')[1],
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 12.0,
              ),
            ),
            const SizedBox(
              height: 4.0,
            ),
            Text(
              date.split(' ')[0],
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 12.0,
              ),
            ),
            const SizedBox(
              height: 4.0,
            ),
            GetConditionIcon(
              condition: model.condition!.code!,
              isDay: model.isDay! == 1,
              height: 64.0,
              width: 64.0,
            ),
            const SizedBox(
              height: 16.0,
            ),
            Text(
              '${model.temp} °',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 16.0,
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Text(
              '${model.feelsLike} °',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 16.0,
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Lottie.asset(
              'assets/lotties/humidity.json',
              height: 40,
              width: 40,
            ),
            Text(
              '${model.humidity}',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 16.0,
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Lottie.asset(
              'assets/lotties/wind.json',
              height: 40,
              width: 30,
            ),
            Text(
              '${model.windSpeed}',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 16.0,
              ),
            ),
            Text(
              '${model.windDirection}',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 16.0,
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Lottie.asset(
              'assets/lotties/uv.json',
              height: 40,
              width: 30,
            ),
            Text(
              '${model.uv}',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
