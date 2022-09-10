import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/shared/constants.dart';
import 'package:weather_app/core/widgets/default_text_button.dart';
import 'package:weather_app/features/manage_locations/presentation/cubit/cubit.dart';
import 'package:weather_app/features/manage_locations/presentation/cubit/states.dart';
import 'package:weather_app/features/manage_locations/presentation/pages/contact_us_page.dart';
import 'package:weather_app/features/manage_locations/presentation/pages/manage_locations_page.dart';
import 'package:weather_app/features/manage_locations/presentation/pages/report_page.dart';
import 'package:weather_app/features/manage_locations/presentation/pages/widgets/location_widget.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({Key? key, required this.currentLocation}) : super(key: key);
  final String currentLocation;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: darkBackgroundColor,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 8.0,
            left: 16.0,
            right: 16.0,
          ),
          child: SingleChildScrollView(
            child: BlocBuilder<LocationCubit, LocationStates>(
              builder: (context, state) {
                return Column(
                  children: [
                    const SizedBox(
                      height: 16.0,
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.star_outlined,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 32.0,
                        ),
                        Text(
                          'Current location',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            fontSize: 12.0,
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.info_outline_rounded,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    LocationWidget(
                      locationName: currentLocation,
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    const Divider(
                      thickness: 2,
                      indent: 4,
                      endIndent: 4,
                      color: Colors.white,
                      height: 20,
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.add_location_outlined,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 32.0,
                        ),
                        Text(
                          'Other locations',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    if (LocationCubit.get(context)
                        .favouriteLocations
                        .isNotEmpty)
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return LocationWidget(
                              locationName: LocationCubit.get(context)
                                  .favouriteLocations[index]);
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 16.0,
                          );
                        },
                        itemCount: LocationCubit.get(context)
                            .favouriteLocations
                            .length,
                      ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    DefaultTextButton(
                      onPressed: () {
                        navigateTo(
                            context: context, route: ManageLocationsPage());
                      },
                      text: 'Manage locations',
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    const Divider(
                      thickness: 2,
                      indent: 4,
                      endIndent: 4,
                      color: Colors.white,
                      height: 20,
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    InkWell(
                      onTap: () => navigateTo(
                          context: context, route:  ReportPage()),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.info_outline_rounded,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 32.0,
                          ),
                          Text(
                            'Report Wrong Location',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    InkWell(
                      onTap: () => navigateTo(
                          context: context, route: const ContactUsPage()),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.headset_mic_rounded,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 32.0,
                          ),
                          Text(
                            'Contact Us',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
