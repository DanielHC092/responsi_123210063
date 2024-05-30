class Agent {
  final String uuid;
  final String displayName;
  final String description;
  final String fullPortrait;

  Agent({
    required this.uuid,
    required this.displayName,
    required this.description,
    required this.fullPortrait,
  });

  factory Agent.fromJson(Map<String, dynamic> json) {
    return Agent(
      uuid: json['uuid'],
      displayName: json['displayName'],
      description: json['description'],
      fullPortrait: json['fullPortrait'],
    );
  }
}

class AgentResponse {
  final List<Agent> dataAgent;

  AgentResponse({required this.dataAgent});

  factory AgentResponse.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    List<Agent> agent = list.map((i) => Agent.fromJson(i)).toList();
    return AgentResponse(dataAgent: agent);
  }
}
