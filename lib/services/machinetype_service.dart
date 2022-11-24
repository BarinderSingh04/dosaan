import 'package:dosaan/models/machine_type.dart';
import 'package:dosaan/services/api_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final machineServiceProvider = Provider<MachineService>((ref) {
  return MachineService(ref.watch(apiServiceProvider));
});

class MachineService {
  final ApiService _apiService;

  MachineService(this._apiService);

  Future<List<MachineType>> getMachineType() async {
    try {
      final response = await _apiService.getRequest("/machine-types");
      final jsonResponse = response as List<dynamic>;
      return jsonResponse.map((e) => MachineType.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }
}
