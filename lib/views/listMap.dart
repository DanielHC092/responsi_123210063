import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:responsi_123210063_danielhanselc/apiDataSource.dart';
import 'package:responsi_123210063_danielhanselc/models/modelMap.dart';

class MapListPage extends StatefulWidget {
  @override
  _MapListPageState createState() => _MapListPageState();
}

class _MapListPageState extends State<MapListPage> {
  late Future<MapsResponse> _mapsFuture;

  @override
  void initState() {
    super.initState();
    _mapsFuture = ApiDataSource.instance.loadMaps();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Valorant Maps'),
        backgroundColor: Colors.redAccent,
      ),
      body: FutureBuilder<MapsResponse>(
        future: _mapsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.maps.isEmpty) {
            return Center(child: Text('No maps found'));
          } else {
            final maps = snapshot.data!.maps;
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 2,
              ),
              itemCount: maps.length,
              itemBuilder: (context, index) {
                final map = maps[index];
                return GestureDetector(
                  onTap: () {
                    if (map.displayIcon != null &&
                        map.displayIcon!.isNotEmpty) {
                      _launchURL(map.displayIcon!);
                    }
                  },
                  child: Card(
                    elevation: 4,
                    margin: EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: map.displayIcon != null &&
                                  map.displayIcon!.isNotEmpty
                              ? Image.network(
                                  map.listViewIcon!,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                )
                              : Icon(Icons.map, size: 100),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                map.displayName,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(map.coordinates),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }

  void _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunch(uri.toString())) {
      await launch(uri.toString());
    } else {
      throw 'Could not launch $url';
    }
  }
}
