import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/core/errors/exceptions.dart';
import 'package:weather_app/core/strings/end_points.dart';
import 'package:weather_app/features/current_location_weather/data/models/data_model.dart';
import 'package:http/http.dart' as http;

abstract class RemoteDataSource {
  Future<DataModel> getRemoteCurrentWeather();

  Future<void> checkLocationPermission();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  RemoteDataSourceImpl({required this.client});

  final http.Client client;

  @override
  Future<void> checkLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw LocationPermissionException();
      } else if (permission == LocationPermission.deniedForever) {
        throw LocationPermissionException();
      }
    }
  }

  @override
  Future<DataModel> getRemoteCurrentWeather() async {
    await checkLocationPermission();
    final Position cur = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    final response = await client.get(Uri.parse(
        "$BASE_URL/forecast.json?key=$API_KEY&q=${cur.latitude},${cur.longitude}&days=10"));
    if (response.statusCode == 200) {
      final decodedJson = json.decode(response.body);
      DataModel model = DataModel.fromJson(decodedJson);
      return model;
    }
    throw ApiException();
  }
}
