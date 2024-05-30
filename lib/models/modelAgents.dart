class Agent {
  final String uuid;
  final String displayName;
  final String description;
  final String developerName;
  final String displayIconSmall;

  Agent({
    required this.uuid,
    required this.displayName,
    required this.description,
    required this.developerName,
    required this.displayIconSmall,
  });

  factory Agent.fromJson(Map<String, dynamic> json) {
    return Agent(
      uuid: json['uuid'],
      displayName: json['displayName'],
      description: json['description'],
      developerName: json['developerName'],
      displayIconSmall: json['displayIconSmall'],
    );
  }
}

class AgentsResponse {
  final List<Agent> data;

  AgentsResponse({required this.data});

  factory AgentsResponse.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    List<Agent> agentlist = list.map((i) => Agent.fromJson(i)).toList();
    return AgentsResponse(data: agentlist);
  }
}
