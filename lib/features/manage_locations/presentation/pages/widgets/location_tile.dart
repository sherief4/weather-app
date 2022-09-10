import 'package:flutter/material.dart';
import 'package:weather_app/core/shared/constants.dart';
import 'package:weather_app/features/manage_locations/presentation/cubit/cubit.dart';

class LocationTile extends StatelessWidget {
  const LocationTile({
    Key? key,
    required this.index,
    required this.cityName,
  }) : super(key: key);
  final String cityName;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(
          16.0,
        ),
      ),
      child: ListTile(
        onTap: () {},
        title: Row(
          children: [
            Text(
              cityName,
              style: const TextStyle(
                color: Colors.white,
                letterSpacing: 1,
                fontSize: 18.0,
              ),
            ),
            const SizedBox(
              width: 8.0,
            ),
            const Icon(
              Icons.location_pin,
              color: Colors.white,
              size: 18.0,
            )
          ],
        ),
        trailing: IconButton(
          icon: const Icon(
            Icons.delete,
            color: Colors.white,
          ),
          onPressed: () {
            LocationCubit.get(context).removeCityFromFavourites(index: index);
          },
        ),
      ),
    );
  }
}
