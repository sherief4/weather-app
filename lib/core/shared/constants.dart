import 'package:flutter/material.dart';
import 'package:weather_app/core/errors/failures.dart';
import 'package:weather_app/core/strings/failures.dart';

Color backgroundColor = const Color(0xff7eb1f2);

Color darkBackgroundColor = const Color(0xff2c3640);

navigateAndFinish({
  required BuildContext context,
  required Widget route,
}) {
  Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute(builder: (context) {
      return route;
    }),
    (route) => false,
  );
}

navigateTo({
  required BuildContext context,
  required Widget route,
}) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
    return route;
  }));
}

showSnackBar(BuildContext context, String text) {
  return ScaffoldMessenger.of(context)
      .showSnackBar(
        SnackBar(
          backgroundColor: Colors.white,
          content: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 5.0,
            ),
            child: Text(
              text,
              style: TextStyle(
                color: darkBackgroundColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          elevation: 10.0,
        ),
      )
      .close;
}

String mapFailureToString(Failure failure) {
  switch (failure.runtimeType) {
    case ApiFailure:
      return API_FAILURE_MESSAGE;

    case EmptyCacheFailure:
      return EMPTY_CACHE_FAILURE_MESSAGE;

    case OfflineFailure:
      return OFFLINE_FAILURE_MESSAGE;

    case LocationPermissionFailure:
      return LOCATION_PERMISSION_FAILURE_MESSAGE;

    default:
      return "Unexpected failure, please try again later";
  }
}
  
