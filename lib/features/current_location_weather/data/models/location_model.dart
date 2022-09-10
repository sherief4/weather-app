import 'package:weather_app/features/current_location_weather/domain/entities/location.dart';

class LocationModel extends Location {
  const LocationModel({
    final String? name,
    final String? country,
    final double? lat,
    final double? lon,
    final String? localTime,
  }) : super(
            name: name,
            country: country,
            lat: lat,
            lon: lon,
            localTime: localTime);

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
        name: json['name'],
        country: json['country'],
        lat: json['lat'],
        lon: json['lon'],
        localTime: json['localtime']);
  }

  @override
  Map<String, dynamic> toJson() => {
        'name': name,
        'country': country,
        'lat': lat,
        'lon': lon,
        'localtime': localTime,
      };
}
