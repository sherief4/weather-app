import 'package:weather_app/features/current_location_weather/domain/entities/condition.dart';

class ConditionModel extends Condition {
  const ConditionModel({
    String? text,
    int? code,
  }) : super(
          text: text,
          code: code,
        );

  factory ConditionModel.fromJson(Map<String, dynamic> json) {
    return ConditionModel(text: json['text'], code: json['code']);
  }

  @override
  Map<String, dynamic> toJson() => {
        'text': text,
        'code': code,
      };
}
