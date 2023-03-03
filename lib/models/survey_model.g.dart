// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SurveyModel _$SurveyModelFromJson(Map<String, dynamic> json) => $checkedCreate(
      'SurveyModel',
      json,
      ($checkedConvert) {
        final val = SurveyModel(
          id: $checkedConvert('id', (v) => v as int?),
          name: $checkedConvert('name', (v) => v as String?),
          sectionId: $checkedConvert('section_id', (v) => v as String?),
          type: $checkedConvert('type', (v) => v as int?),
          order: $checkedConvert('order', (v) => v as String?),
          notes: $checkedConvert('notes', (v) => v as String?),
          note: $checkedConvert('note', (v) => v as String?),
          followUp: $checkedConvert('follow_up', (v) => v as String?),
          followUpQuestion:
              $checkedConvert('follow_up_question', (v) => v as String?),
          followUpQuestionType:
              $checkedConvert('follow_up_question_type', (v) => v as int?),
          sectionName: $checkedConvert('section_name', (v) => v as String?),
          typeName: $checkedConvert('type_name', (v) => v as String?),
          followUpQuestionTypeName: $checkedConvert(
              'follow_up_question_type_name', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'sectionId': 'section_id',
        'followUp': 'follow_up',
        'followUpQuestion': 'follow_up_question',
        'followUpQuestionType': 'follow_up_question_type',
        'sectionName': 'section_name',
        'typeName': 'type_name',
        'followUpQuestionTypeName': 'follow_up_question_type_name'
      },
    );

Map<String, dynamic> _$SurveyModelToJson(SurveyModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'section_id': instance.sectionId,
      'type': instance.type,
      'order': instance.order,
      'notes': instance.notes,
      'note': instance.note,
      'follow_up': instance.followUp,
      'follow_up_question': instance.followUpQuestion,
      'follow_up_question_type': instance.followUpQuestionType,
      'section_name': instance.sectionName,
      'type_name': instance.typeName,
      'follow_up_question_type_name': instance.followUpQuestionTypeName,
    };
