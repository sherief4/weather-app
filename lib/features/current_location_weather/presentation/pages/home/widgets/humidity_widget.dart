import 'package:flutter/material.dart';

class HumidityWidget extends StatelessWidget {
  const HumidityWidget({Key? key, required this.value})
      : super(key: key);
  final double? value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.water_drop,
          color: Color(0xffb9d4f2),
        ),
        Text(
          '$value',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 14.0,
          ),
        ),
      ],
    );
  }
}