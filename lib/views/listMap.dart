import 'package:responsi_123210063_danielhanselc/views/listAgent.dart';

import '../models/modelMap.dart';
import '../apiDataSource.dart';
import 'package:flutter/material.dart';

class ListMaps extends StatefulWidget {
  const ListMaps({
    super.key,
  });

  @override
  State<ListMaps> createState() => _ListMapsState();
}

class _ListMapsState extends State<ListMaps> {
  late Future<MapsResponse> futureMaps;

  @override
  void initState() {
    super.initState();
    futureMaps = ApiDataSource.instance.loadMaps();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Map"),
      ),
      body: _buildListMaps(),
    );
  }

  Widget _buildListMaps() {
    return Container(
      child: FutureBuilder<MapsResponse>(
        future: futureMaps,
        builder: (BuildContext context, AsyncSnapshot<MapsResponse> snapshot) {
          if (snapshot.hasError) {
            return _buildError();
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return _buildLoading();
          }
          if (snapshot.hasData) {
            return _buildSuccess(snapshot.data!);
          }
          return _buildLoading();
        },
      ),
    );
  }

  Widget _buildError() {
    return Center(
      child: Text("Error loading maps"),
    );
  }

  Widget _buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildSuccess(MapsResponse mapsResponse) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8, // Aspect ratio for each item
      ),
      itemCount: mapsResponse.data.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildItem(mapsResponse.data[index]);
      },
    );
  }

  Widget _buildItem(Maps maps) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ListAgent(),
          )),
      child: Card(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 150,
              child: Image.network(
                maps.displayIcon!,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 8),
            Text(
              maps.displayName,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
