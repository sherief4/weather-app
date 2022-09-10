import 'package:flutter/material.dart';

class GetConditionIcon extends StatelessWidget {
  const GetConditionIcon(
      {Key? key,
      required this.condition,
      required this.isDay,
      required this.width,
      required this.height})
      : super(key: key);
  final int condition;
  final bool isDay;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    String source = isDay ? 'day' : 'night';
    return Image.asset(
      'assets/images/$source/${(condition - 1000) + 113}.png',
      height:height,
      width: width,
    );
  }
}
