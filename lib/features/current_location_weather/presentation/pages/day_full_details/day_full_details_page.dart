import 'package:flutter/material.dart';
import 'package:weather_app/core/shared/constants.dart';
import 'package:weather_app/features/current_location_weather/domain/entities/hour_weather.dart';
import 'package:weather_app/features/current_location_weather/presentation/pages/day_full_details/widgets/vertical_weather_widget.dart';

class DayFullDetailsPage extends StatelessWidget {
  const DayFullDetailsPage({
    Key? key,
    required this.hourWeatherList,
  }) : super(key: key);
  final List<HourWeather> hourWeatherList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Whole day forecast',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 24.0,
              ),
            ),
            const SizedBox(
              height: 32.0,
            ),
            SizedBox(
              height: 500,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return VerticalWeatherWidget(
                      model: hourWeatherList[index - 2 + DateTime.now().hour],
                      index: index - 2 + DateTime.now().hour);
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    width: 16.0,
                  );
                },
                itemCount: hourWeatherList.length - DateTime.now().hour + 2,
              ),
            ),
          ],
        ),
      )),
    );
  }
}
