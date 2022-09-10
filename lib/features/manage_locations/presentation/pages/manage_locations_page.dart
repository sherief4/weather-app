import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/shared/constants.dart';
import 'package:weather_app/features/manage_locations/presentation/cubit/cubit.dart';
import 'package:weather_app/features/manage_locations/presentation/cubit/states.dart';
import 'package:weather_app/features/manage_locations/presentation/pages/widgets/location_tile.dart';
import 'package:weather_app/features/manage_locations/presentation/pages/show_search_result.dart';

class ManageLocationsPage extends StatelessWidget {
  ManageLocationsPage({Key? key}) : super(key: key);
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: const Text(
          'Manage Locations',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 20.0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(
          16.0,
        ),
        child: BlocConsumer<LocationCubit, LocationStates>(
          listener: (context, state) {
            if (state is GetSearchDataSuccessState) {
              navigateTo(
                context: context,
                route: ShowSearchResultPage(
                  searchResult: state.searchResult,
                  isResult: true,
                ),
              );
            }
            if (state is GetSearchDataErrorState){
              showSnackBar(context, 'No Result');
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  TextFormField(
                    autofocus: false,
                    controller: searchController,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: darkBackgroundColor,
                        ),
                        borderRadius: BorderRadius.circular(
                          35.0,
                        ),
                      ),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      suffixIcon: TextButton(
                        child: const Text(
                          'Search',
                        ),
                        onPressed: () {
                          FocusManager.instance.primaryFocus?.unfocus();

                          LocationCubit.get(context)
                              .getSearchData(city: searchController.text);
                        },
                      ),
                      hintText: 'Enter location',
                      hintStyle: const TextStyle(
                        color: Colors.grey,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: darkBackgroundColor,
                        ),
                        borderRadius: BorderRadius.circular(
                          35.0,
                        ),
                      ),
                      fillColor: Colors.black26,
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  if (LocationCubit.get(context).favouriteLocations.isNotEmpty)
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return LocationTile(
                          cityName: LocationCubit.get(context)
                              .favouriteLocations[index],
                          index: index,
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 16.0,
                        );
                      },
                      itemCount:
                          LocationCubit.get(context).favouriteLocations.length,
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
