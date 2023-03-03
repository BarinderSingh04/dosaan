import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/survey_model.dart';
import '../../services/machinetype_service.dart';

final surveyListProvider =
    FutureProvider.autoDispose<List<SurveyModel>>((ref) async {
  final surveys = await ref.watch(machineServiceProvider).getSurveyModel();
  final generalSurvey =
      surveys.where((s) => s.sectionName == "General").toList();
  return generalSurvey;
});