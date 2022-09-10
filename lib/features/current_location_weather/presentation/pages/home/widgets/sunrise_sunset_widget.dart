import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SunriseSunsetWidget extends StatelessWidget {
  const SunriseSunsetWidget({Key? key, required this.sunrise, required this.sunset}) : super(key: key);
final String sunrise;
final String sunset;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
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
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Column(
              children: [
                const Text(
                  'Sunrise',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 16.0,
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Text(
                  sunrise,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 14.0,
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Lottie.asset(
                  "assets/lotties/sunrise.json",
                  width: 100,
                  height: 100.0,
                ),
              ],
            ),
            const Spacer(),
            Column(
              children: [
                const Text(
                  'Sunset',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 16.0,
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Text(
                sunset,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 14.0,
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Lottie.asset(
                  "assets/lotties/sunset.json",
                  width: 100,
                  height: 100.0,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
