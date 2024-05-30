class Ability {
  final String slot;
  final String displayName;
  final String description;
  final String displayIcon;

  Ability({
    required this.slot,
    required this.displayName,
    required this.description,
    required this.displayIcon,
  });

  factory Ability.fromJson(Map<String, dynamic> json) {
    return Ability(
      slot: json['slot'],
      displayName: json['displayName'] ?? '',
      description: json['description'] ?? '',
      displayIcon: json['displayIcon'] ?? '',
    );
  }
}

class Role {
  final String uuid;
  final String displayName;
  final String description;
  final String displayIcon;

  Role({
    required this.uuid,
    required this.displayName,
    required this.description,
    required this.displayIcon,
  });

  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(
      uuid: json['uuid'],
      displayName: json['displayName'] ?? '',
      description: json['description'] ?? '',
      displayIcon: json['displayIcon'] ?? '',
    );
  }
}

class Agent {
  final String uuid;
  final String displayName;
  final String description;
  final String fullPortrait;
  final Role? role;
  final List<Ability> abilities;

  Agent({
    required this.uuid,
    required this.displayName,
    required this.description,
    required this.fullPortrait,
    this.role,
    required this.abilities,
  });

  factory Agent.fromJson(Map<String, dynamic> json) {
    var abilitiesFromJson = json['abilities'] as List;
    List<Ability> abilitiesList =
        abilitiesFromJson.map((i) => Ability.fromJson(i)).toList();
    return Agent(
      uuid: json['uuid'],
      displayName: json['displayName'],
      description: json['description'],
      fullPortrait: json['fullPortrait'] ?? '',
      role: json['role'] != null ? Role.fromJson(json['role']) : null,
      abilities: abilitiesList,
    );
  }
}

class AgentResponse {
  final Agent agent;

  AgentResponse({required this.agent});

  factory AgentResponse.fromJson(Map<String, dynamic> json) {
    return AgentResponse(agent: Agent.fromJson(json['data']));
  }
}
