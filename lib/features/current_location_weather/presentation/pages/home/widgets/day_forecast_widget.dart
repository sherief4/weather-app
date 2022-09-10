import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/features/current_location_weather/domain/entities/day_forecast.dart';
import 'package:weather_app/features/current_location_weather/presentation/pages/home/widgets/humidity_widget.dart';

class DayForecastWidget extends StatelessWidget {
  const DayForecastWidget(
      {Key? key, required this.dayForecastModel, required this.index})
      : super(key: key);
  final DayForecast dayForecastModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    final String day = index == 0
        ? 'Today'
        : DateFormat('EEEE').format(DateTime.now().add(Duration(days: index)));

    return Row(
      children: [
        Text(
          day,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 14.0,
          ),
        ),
        const Spacer(),
        HumidityWidget(
          value: dayForecastModel.dayWeather!.humidity,
        ),
        const SizedBox(
          width: 16.0,
        ),
        const Icon(
          Icons.nights_stay,
          color: Colors.amber,
        ),
        const SizedBox(
          width: 16.0,
        ),
        const Icon(
          Icons.circle,
          color: Colors.amber,
        ),
        const SizedBox(
          width: 16.0,
        ),
        Text(
          '${dayForecastModel.dayWeather!.minTemp!.round()} °',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 14.0,
          ),
        ),
        const SizedBox(
          width: 16.0,
        ),
        Text(
          '${dayForecastModel.dayWeather!.maxTemp!.round()} °',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 14.0,
          ),
        ),
      ],
    );
  }
}
