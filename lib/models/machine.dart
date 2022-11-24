import 'package:json_annotation/json_annotation.dart';

part "machine.g.dart";

@JsonSerializable(createToJson: false)
class Machine {
  final int id;
  final String name;
  final String image;
  

  factory Machine.fromJson(Map<String, dynamic> json) =>
      _$MachineFromJson(json);

  Machine(this.id, this.name, this.image);
}

@JsonSerializable(createToJson: false)
class Serial {
  final int id;
  @JsonKey(name: "machine_id", fromJson: _converInt)
  final int machineId;
  final String name;

  factory Serial.fromJson(Map<String, dynamic> json) => _$SerialFromJson(json);

   static int _converInt(String value) {
    return int.tryParse(value) ?? 0;
  }

  Serial(this.id, this.name, this.machineId);
}

@JsonSerializable(createToJson: false)
class Model {
  final int id;
  @JsonKey(name: "machine_id", fromJson: _converInt)
  final int machineId;
  final String name;

  factory Model.fromJson(Map<String, dynamic> json) => _$ModelFromJson(json);

  static int _converInt(String value) {
    return int.tryParse(value) ?? 0;
  }
 
  Model(this.id, this.name, this.machineId);
}
