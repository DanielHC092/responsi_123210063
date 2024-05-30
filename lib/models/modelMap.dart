class Maps {
  final String uuid;
  final String displayName;
  final String displayIcon;

  Maps({
    required this.uuid,
    required this.displayName,
    required this.displayIcon,
  });

  factory Maps.fromJson(Map<String, dynamic> json) {
    return Maps(
      uuid: json['uuid'],
      displayName: json['displayName'],
      displayIcon: json['displayIcon'],
    );
  }
}

class MapsResponse {
  final List<Maps> data;

  MapsResponse({required this.data});

  factory MapsResponse.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    List<Maps> maplist = list.map((i) => Maps.fromJson(i)).toList();
    return MapsResponse(data: maplist);
  }
}
