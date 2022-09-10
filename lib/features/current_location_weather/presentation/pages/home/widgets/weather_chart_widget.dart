import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:weather_app/core/shared/constants.dart';
import 'package:weather_app/core/widgets/default_text_button.dart';
import 'package:weather_app/features/current_location_weather/domain/entities/day_forecast.dart';
import 'package:weather_app/features/current_location_weather/domain/entities/hour_weather.dart';
import 'package:weather_app/features/current_location_weather/presentation/pages/day_full_details/day_full_details_page.dart';
import 'package:weather_app/features/current_location_weather/presentation/pages/home/widgets/hour_weather_widget.dart';

class WeatherChartWidget extends StatelessWidget {
  const WeatherChartWidget({
    Key? key,
    required this.dayForecastModel,
  }) : super(key: key);

  final DayForecast dayForecastModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 340,
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
        padding: const EdgeInsets.all(
          16.0,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 88,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {

                  return HourWeatherWidget(
                    time: dayForecastModel.hoursWeather![index].dateTime!
                        .split(' ')[1],
                    temp: dayForecastModel.hoursWeather![index].temp!.round(),
                    condition:
                        dayForecastModel.hoursWeather![index].condition!.code!,
                    isDay:dayForecastModel.hoursWeather![index].isDay == 1 ,
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    width: 16.0,
                  );
                },
                itemCount: dayForecastModel.hoursWeather!.length,
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            SizedBox(
              height: 150,
              width: double.infinity,
              child: SfCartesianChart(
                  margin: EdgeInsets.zero,
                  enableSideBySideSeriesPlacement: false,
                  plotAreaBorderWidth: 0,
                  primaryXAxis: CategoryAxis(
                    isVisible: false,
                    majorGridLines: const MajorGridLines(width: 0),
                    axisLine: const AxisLine(width: 0),
                  ),
                  primaryYAxis: NumericAxis(
                    isVisible: false,
                    majorGridLines: const MajorGridLines(width: 0),
                    //Hide the axis line of y-axis
                    axisLine: const AxisLine(
                      width: 0,
                    ),
                  ),
                  series: <ChartSeries<HourWeather, String>>[
                    // Renders line chart
                    SplineSeries<HourWeather, String>(
                      color: Colors.white,
                      width: 4,
                      dataSource: dayForecastModel.hoursWeather!,
                      xValueMapper: (HourWeather h, _) => h.dateTime,
                      yValueMapper: (HourWeather h, _) => h.temp,
                    ),
                  ]),
            ),
            DefaultTextButton(
              onPressed: () {
                navigateTo(
                  context: context,
                  route: DayFullDetailsPage(
                    hourWeatherList: dayForecastModel.hoursWeather!,
                  ),
                );
              },
              text: 'Full Details',
            ),
          ],
        ),
      ),
    );
  }
}
