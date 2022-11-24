import 'package:json_annotation/json_annotation.dart';

part "machine_type.g.dart";

@JsonSerializable(createToJson: false)
class MachineType {
  final int type;
  final String name;
  final String image;

  factory MachineType.fromJson(Map<String, dynamic> json) => _$MachineTypeFromJson(json);

  MachineType(this.type, this.name, this.image);
}
