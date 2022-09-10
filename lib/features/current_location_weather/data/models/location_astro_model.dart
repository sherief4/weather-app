import 'package:weather_app/features/current_location_weather/domain/entities/location_astro.dart';

class LocationAstroModel extends LocationAstro {
  const LocationAstroModel({
    final String? sunrise,
    final String? sunset,
  }) : super(
          sunrise: sunrise,
          sunset: sunset,
        );

  factory LocationAstroModel.fromJson(Map<String, dynamic> json) {
    return LocationAstroModel(sunset: json['sunset'], sunrise: json['sunrise']);
  }

  @override
  Map<String, dynamic> toJson() => {
        'sunrise': sunrise,
        'sunset': sunset,
      };
}
