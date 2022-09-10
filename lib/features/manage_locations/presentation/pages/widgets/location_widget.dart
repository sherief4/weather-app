import 'package:flutter/material.dart';
import 'package:weather_app/features/manage_locations/presentation/cubit/cubit.dart';
import 'package:weather_app/features/manage_locations/presentation/pages/show_search_result.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({
    Key? key,
    required this.locationName,
  }) : super(key: key);
  final String locationName;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        LocationCubit.get(context)
            .getSearchData(city: locationName)
            .then((value) {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ShowSearchResultPage(
                  searchResult: LocationCubit.get(context).searchResultModel,
                  isResult: false)));
        });
      },
      child: Row(
        children: [
          const SizedBox(
            width: 16.0,
          ),
          const Icon(
            Icons.location_pin,
            size: 12.0,
            color: Colors.white,
          ),
          const SizedBox(
            width: 4.0,
          ),
          Text(
            locationName,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}
