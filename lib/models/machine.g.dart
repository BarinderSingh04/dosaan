// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'machine.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Machine _$MachineFromJson(Map<String, dynamic> json) => Machine(
      json['id'] as int,
      json['name'] as String,
      json['image'] as String,
    );

Serial _$SerialFromJson(Map<String, dynamic> json) => Serial(
      json['id'] as int,
      json['name'] as String,
      Serial._converInt(json['machine_id'] as String),
    );

Model _$ModelFromJson(Map<String, dynamic> json) => Model(
      json['id'] as int,
      json['name'] as String,
      Model._converInt(json['machine_id'] as String),
    );
