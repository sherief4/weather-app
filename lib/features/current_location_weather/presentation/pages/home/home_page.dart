import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/core/shared/constants.dart';
import 'package:weather_app/features/current_location_weather/domain/entities/data.dart';
import 'package:weather_app/features/current_location_weather/presentation/pages/home/widgets/details_widget.dart';
import 'package:weather_app/features/current_location_weather/presentation/pages/home/widgets/forecast_widget.dart';
import 'package:weather_app/features/manage_locations/presentation/pages/widgets/home_drawer.dart';
import 'package:weather_app/features/current_location_weather/presentation/pages/home/widgets/sunrise_sunset_widget.dart';
import 'widgets/weather_chart_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.currentWeather}) : super(key: key);
  final Data currentWeather;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController scrollController;
  Color currentBackground =backgroundColor;

  @override
  void initState() {
    scrollController = ScrollController();

    scrollController.addListener(() {

      if (scrollController.position.pixels > 120) {
        setState(() {
          currentBackground = darkBackgroundColor;
        });
      } else {
        setState(() {
          currentBackground = backgroundColor;
        });
      }
    });
    super.initState();
  }
  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final String asset = widget.currentWeather.currentWeather!.isDay == 1
        ? "assets/lotties/day.json"
        : "assets/lotties/night.json";

    return Scaffold(
        drawer:  HomeDrawer(currentLocation: widget.currentWeather.location!.name!,),
        body: CustomScrollView(
          controller: scrollController,
          slivers: [
            SliverAppBar(
              backgroundColor: currentBackground,
              title: Text(
                "${widget.currentWeather.location!.name}",
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white,

                  fontWeight: FontWeight.w400,
                  fontSize: 20.0,
                ),
              ),
              expandedHeight: 220,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  color: backgroundColor,
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 16.0,),
                          Row(
                            children: [
                              Text(
                                '${widget.currentWeather.currentWeather!.temp!.round()} °',
                                style: const TextStyle(
                                  fontSize: 60.0,
                                  fontWeight: FontWeight.w200,
                                  color: Colors.white,
                                ),
                              ),
                              const Spacer(),
                              Lottie.asset(
                                asset,
                                height: 120,
                                width: 120,
                              ),
                            ],
                          ),
                          Text(
                            '${widget.currentWeather.daysForecast!.daysForecast![0].dayWeather!.minTemp!.round()}° / ${widget.currentWeather.daysForecast!.daysForecast![0].dayWeather!.maxTemp!.round()}° Feels like ${widget.currentWeather.currentWeather!.feelsLike!.round()}°',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16.0,
                            ),
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            DateFormat('EE, hh:mm a').format(DateTime.now()),
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Container(
                  color: currentBackground,
                  child: Padding(
                    padding: const EdgeInsets.all(
                      16.0,
                    ),
                    child: Column(
                      children: [
                        WeatherChartWidget(
                          dayForecastModel:
                              widget.currentWeather.daysForecast!.daysForecast![0],
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        Container(
                          height: 80,
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Today\'s Temperature',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 14.0,
                                  ),
                                ),
                                const SizedBox(
                                  height: 8.0,
                                ),
                                Text(
                                  '${widget.currentWeather.currentWeather!.condition!.text}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        ForecastWidget(
                          data: widget.currentWeather.daysForecast!.daysForecast!,
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        SunriseSunsetWidget(
                          sunrise: widget.currentWeather.daysForecast!.daysForecast![0]
                              .locationAstro!.sunrise!,
                          sunset: widget.currentWeather.daysForecast!.daysForecast![0]
                              .locationAstro!.sunset!,
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        DetailsWidget(
                          uv: '${widget.currentWeather.currentWeather!.uv}',
                          windSpeed:
                              '${widget.currentWeather.currentWeather!.windSpeed}',
                          humidity:
                              '${widget.currentWeather.currentWeather!.humidity}',
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                      ],
                    ),
                  ),
                )
              ]),
            )
          ],
        ));
  }
}
