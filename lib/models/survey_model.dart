import 'package:json_annotation/json_annotation.dart';

part "survey_model.g.dart";

@JsonSerializable(fieldRename: FieldRename.snake, checked: true)
class SurveyModel {
  final int? id;
  final String? name;
  final String? sectionId;
  final int? type;
  final String? order;
  final String? notes;
  final String? note;
  final String? followUp;
  final String? followUpQuestion;
  final int? followUpQuestionType;
  final String? sectionName;
  final String? typeName;
  final String? followUpQuestionTypeName;

  SurveyModel({
    this.id,
    this.name,
    this.sectionId,
    this.type,
    this.order,
    this.notes,
    this.note,
    this.followUp,
    this.followUpQuestion,
    this.followUpQuestionType,
    this.sectionName,
    this.typeName,
    this.followUpQuestionTypeName,
  });

  factory SurveyModel.fromJson(Map<String, dynamic> json) =>
      _$SurveyModelFromJson(json);
}
