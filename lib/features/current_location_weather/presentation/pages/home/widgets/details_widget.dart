import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class DetailsWidget extends StatelessWidget {
  const DetailsWidget(
      {Key? key,
      required this.uv,
      required this.windSpeed,
      required this.humidity})
      : super(key: key);
  final String uv;
  final String windSpeed;
  final String humidity;

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
        padding: const EdgeInsets.all(
          16.0,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Lottie.asset(
                  'assets/lotties/uv.json',
                  height: 50,
                  width: 50,
                ),
                const SizedBox(
                  height: 8.0,
                ),
                const Text(
                  "UV index",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 16.0,
                  ),
                ),
                Text(
                  uv,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Lottie.asset(
                  'assets/lotties/wind.json',
                  height: 50,
                  width: 50,
                ),
                const SizedBox(
                  height: 8.0,
                ),
                const Text(
                  "Wind",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 16.0,
                  ),
                ),
                Text(
                  '$windSpeed Km/h',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Lottie.asset(
                  'assets/lotties/humidity.json',
                  height: 50,
                  width: 50,
                ),
                const SizedBox(
                  height: 8.0,
                ),
                const Text(
                  "Humidity",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 16.0,
                  ),
                ),
                Text(
                  humidity,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
