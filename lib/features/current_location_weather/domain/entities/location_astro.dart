import 'package:equatable/equatable.dart';

class LocationAstro extends Equatable {
  const LocationAstro({this.sunset, this.sunrise});

  final String? sunrise;
  final String? sunset;

  Map<String, dynamic> toJson() => {};

  @override
  List<Object?> get props => [
        sunrise,
        sunset,
      ];
}
