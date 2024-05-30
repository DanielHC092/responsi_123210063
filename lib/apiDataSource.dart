import 'package:responsi_123210063_danielhanselc/models/modelAgentDetail.dart';
import 'package:responsi_123210063_danielhanselc/models/modelAgents.dart';
import 'package:responsi_123210063_danielhanselc/models/modelMap.dart';
import 'baseNetwork.dart';

class ApiDataSource {
  static ApiDataSource instance = ApiDataSource();
  Future<AgentsResponse> loadAgents() async {
    final jsonResponse = await BaseNetwork.get("agents");
    return AgentsResponse.fromJson(jsonResponse);
  }

  Future<MapsResponse> loadMaps() async {
    final jsonResponse = await BaseNetwork.get("maps");
    return MapsResponse.fromJson(jsonResponse);
  }

  Future<AgentResponse> loadAgentDetail(String idDiterima) async {
    final jsonResponse = await BaseNetwork.get("agents/$idDiterima");
    return AgentResponse.fromJson(jsonResponse);
  }
}
