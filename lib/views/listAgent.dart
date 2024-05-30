import 'package:responsi_123210063_danielhanselc/views/detailAgent.dart';
import 'package:responsi_123210063_danielhanselc/views/listMap.dart';

import '../models/modelAgents.dart';
import 'package:flutter/material.dart';
import '../apiDataSource.dart';

class ListAgent extends StatefulWidget {
  const ListAgent({super.key});

  @override
  State<ListAgent> createState() => _ListAgentState();
}

class _ListAgentState extends State<ListAgent> {
  late Future<AgentsResponse> futureCategories;

  @override
  void initState() {
    super.initState();
    futureCategories = ApiDataSource.instance.loadAgents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Agent"),
      ),
      body: _buildListCategories(),
    );
  }

  Widget _buildListCategories() {
    return Container(
      child: FutureBuilder<AgentsResponse>(
        future: futureCategories,
        builder:
            (BuildContext context, AsyncSnapshot<AgentsResponse> snapshot) {
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
      child: Text("Error loading categories"),
    );
  }

  Widget _buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildSuccess(AgentsResponse agentsResponse) {
    return ListView.builder(
      itemCount: agentsResponse.data.length,
      itemBuilder: (BuildContext context, index) {
        return _buildItem(agentsResponse.data[index]);
      },
    );
  }

  Widget _buildItem(Agent agent) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailAgent(
              agentId: agent.uuid,
            ),
          )),
      child: Card(
        child: Row(
          children: [
            Container(
              width: 100,
              child: Image.network(agent.displayIconSmall!),
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              agent.displayName,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
