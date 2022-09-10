import 'package:equatable/equatable.dart';

class Condition extends Equatable {
  const Condition({this.text, this.code});

  final String? text;
  final int? code;

   Map<String , dynamic> toJson()=>{};


  @override
  List<Object?> get props => [text, code];
}
