import 'package:equatable/equatable.dart';

class Location extends Equatable {
  const Location({
    this.name,
    this.country,
    this.lat,
    this.lon,
    this.localTime,
  });

  final String? name;
  final String? country;
  final double? lat;
  final double? lon;
  final String? localTime;

  Map<String, dynamic> toJson() => {};

  @override
  List<Object?> get props => [name, country, lat, lon, localTime];
}
