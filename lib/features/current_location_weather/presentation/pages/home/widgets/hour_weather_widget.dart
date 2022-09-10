import 'package:flutter/material.dart';
import 'package:weather_app/core/widgets/condition_icon.dart';

class HourWeatherWidget extends StatelessWidget {
  const HourWeatherWidget({
    Key? key,
    required this.time,
    required this.temp,
    required this.condition,
    required this.isDay,
  }) : super(key: key);

  final String time;
  final int temp;
  final int condition;
  final bool isDay;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          time,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 14.0,
          ),
        ),
        const SizedBox(
          height: 8.0,
        ),
        GetConditionIcon(
          condition: condition,
          isDay: isDay,
          height: 40.0,
          width: 40.0,
        ),
        const SizedBox(
          height: 8.0,
        ),
        Text(
          "$temp °",
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
