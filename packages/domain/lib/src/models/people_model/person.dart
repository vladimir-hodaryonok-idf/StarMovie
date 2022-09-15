import 'package:domain/src/models/people_model/ids.dart';
import 'package:json_annotation/json_annotation.dart';

part 'person.g.dart';

@JsonSerializable()
class Person {
  Person({
    this.name,
    this.ids,
  });

  final String? name;
  final Ids? ids;

  factory Person.fromJson(dynamic json) => _$PersonFromJson(json);

  Map<String, dynamic> toJson() => _$PersonToJson(this);
}
