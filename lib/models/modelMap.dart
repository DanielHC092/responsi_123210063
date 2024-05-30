class MapModel {
  final String uuid;
  final String displayName;
  final String coordinates;
  final String? displayIcon;
  final String? listViewIcon;

  MapModel({
    required this.uuid,
    required this.displayName,
    required this.coordinates,
    this.displayIcon,
    this.listViewIcon,
  });

  factory MapModel.fromJson(Map<String, dynamic> json) {
    return MapModel(
      uuid: json['uuid'] ?? '',
      displayName: json['displayName'] ?? 'Unknown',
      coordinates: json['coordinates'] ?? 'Unknown',
      displayIcon: json['displayIcon'],
      listViewIcon: json['listViewIcon'],
    );
  }
}

class MapsResponse {
  final List<MapModel> maps;

  MapsResponse({required this.maps});

  factory MapsResponse.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    List<MapModel> mapsList = list.map((i) => MapModel.fromJson(i)).toList();
    return MapsResponse(maps: mapsList);
  }
}
