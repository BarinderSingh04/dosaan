import 'package:dosaan/models/machine.dart';
import 'package:dosaan/services/api_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final machineServiceProvider = Provider<MachineService>((ref) {
  return MachineService(ref.watch(apiServiceProvider));
});

class MachineService {
  final ApiService _apiService;

  MachineService(this._apiService);

  Future<List<Machine>> getMachineType() async {
    try {
      final response = await _apiService.getRequest("/machine-types");
      final jsonResponse = response["data"] as List<dynamic>;
      return jsonResponse.map((e) => Machine.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }
  

  Future<List<Model>> getModels(int machineId) async {
    try {
      final response = await _apiService.getRequest("/surveyor/machines/$machineId/models");
      final jsonResponse = response["data"] as List<dynamic>;
      return jsonResponse.map((e) => Model.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  } 

  Future<List<Serial>> getSerials(int machineId) async {
    try {
      final response = await _apiService.getRequest("/surveyor/machines/$machineId/serials");
      final jsonResponse = response["data"] as List<dynamic>;
      return jsonResponse.map((e) => Serial.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  } 
}
