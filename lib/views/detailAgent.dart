import 'package:flutter/material.dart';
import 'package:responsi_123210063_danielhanselc/models/modelAgentDetail.dart';
import 'package:responsi_123210063_danielhanselc/apiDataSource.dart';

class DetailAgent extends StatefulWidget {
  final String agentId;

  const DetailAgent({Key? key, required this.agentId}) : super(key: key);

  @override
  _DetailAgentState createState() => _DetailAgentState();
}

class _DetailAgentState extends State<DetailAgent> {
  late Future<Agent> futureAgent;

  @override
  void initState() {
    super.initState();
    futureAgent = ApiDataSource.instance
        .loadAgentDetail(widget.agentId)
        .then((response) => response.agent);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Agent Detail"),
        backgroundColor:
            Colors.redAccent, // Mengubah warna AppBar menjadi merah aksen
      ),
      body: FutureBuilder<Agent>(
        future: futureAgent,
        builder: (BuildContext context, AsyncSnapshot<Agent> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error loading agent detail"),
            );
          } else if (snapshot.hasData) {
            return _buildAgentDetail(snapshot.data!);
          } else {
            return Center(
              child: Text("No data available"),
            );
          }
        },
      ),
    );
  }

  Widget _buildAgentDetail(Agent agent) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            agent.fullPortrait,
            width: double.infinity,
            height: 350,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  agent.displayName,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (agent.role != null) ...[
                  SizedBox(height: 8),
                  Text(
                    'Role: ${agent.role!.displayName}',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  SizedBox(height: 8),
                  Text(agent.role!.description),
                ],
                SizedBox(height: 8),
                Text(
                  agent.description,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 16),
                Text(
                  'Abilities',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3 / 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                  ),
                  itemCount: agent.abilities.length,
                  itemBuilder: (context, index) {
                    final ability = agent.abilities[index];
                    return Card(
                      color: Colors
                          .redAccent, // Mengubah warna Card menjadi merah aksen
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ability.displayIcon.isNotEmpty
                              ? Image.network(
                                  ability.displayIcon,
                                  width: 50,
                                  height: 50,
                                )
                              : Icon(Icons.error),
                          SizedBox(height: 8),
                          Text(
                            ability.displayName,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
