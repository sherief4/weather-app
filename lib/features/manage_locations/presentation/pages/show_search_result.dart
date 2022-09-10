import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/core/shared/constants.dart';
import 'package:weather_app/core/widgets/condition_icon.dart';
import 'package:weather_app/features/current_location_weather/presentation/pages/home/widgets/details_widget.dart';
import 'package:weather_app/features/manage_locations/data/search_result_model.dart';
import 'package:weather_app/features/manage_locations/presentation/cubit/cubit.dart';
import 'package:weather_app/features/manage_locations/presentation/cubit/states.dart';
import 'package:weather_app/features/manage_locations/presentation/pages/manage_locations_page.dart';

class ShowSearchResultPage extends StatelessWidget {
  const ShowSearchResultPage(
      {Key? key, required this.searchResult, required this.isResult})
      : super(key: key);
  final SearchResultModel searchResult;
  final bool isResult;

  @override
  Widget build(BuildContext context) {
    final String asset = searchResult.currentWeather!.isDay == 1
        ? "assets/lotties/day.json"
        : "assets/lotties/night.json";
    return BlocConsumer<LocationCubit, LocationStates>(
      listener: (context, state) {
        if (state is AddCityToFavouriteSuccessState) {
          showSnackBar(context, 'Location Saved Successfully');
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: darkBackgroundColor,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            actions: [
              if (isResult)
                SizedBox(
                  width: 80.0,
                  child: InkWell(
                    onTap: () {
                      LocationCubit.get(context).addCityToFavourite(
                        city: searchResult.location!.name!,
                      );
                    },
                    child: const Center(
                      child: Text(
                        'Save',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(
                  16.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '${searchResult.location!.name}, \n${searchResult.location!.country}',
                      style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 32.0,
                      ),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    Text(
                      '${searchResult.currentWeather!.temp!.round()} °',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 48.0,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${searchResult.currentWeather!.condition!.text}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 32.0,
                          ),
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        GetConditionIcon(
                          condition:
                              searchResult.currentWeather!.condition!.code!,
                          isDay: searchResult.currentWeather!.isDay! == 1,
                          width: 100,
                          height: 100.0,
                        ),
                      ],
                    ),
                    Lottie.asset(
                      asset,
                      height: 120,
                      width: 120,
                    ),
                    Text(
                      'Local time : ${searchResult.location!.localTime!.split(' ')[1]}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 32.0,
                      ),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    DetailsWidget(
                      uv: '${searchResult.currentWeather!.uv}',
                      windSpeed: '${searchResult.currentWeather!.windSpeed}',
                      humidity: '${searchResult.currentWeather!.humidity}',
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
