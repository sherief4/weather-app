import 'package:flutter/material.dart';
import 'package:weather_app/core/widgets/default_text_button.dart';
import 'package:weather_app/features/current_location_weather/domain/entities/day_forecast.dart';
import 'package:weather_app/features/current_location_weather/presentation/pages/home/widgets/day_forecast_widget.dart';

class ForecastWidget extends StatelessWidget {
  const ForecastWidget({Key? key, required this.data}) : super(key: key);
  final List<DayForecast> data;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white.withOpacity(
            0.4,
          ),
        ),
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white.withOpacity(
          0.2,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
        child: Column(
          children: [
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return DayForecastWidget(
                  dayForecastModel: data[index],
                  index: index,
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 8.0,
                );
              },
              itemCount: data.length,
            ),
          ],
        ),
      ),
    );
  }
}
