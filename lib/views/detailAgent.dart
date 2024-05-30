import '../models/modelAgentDetail.dart';
import 'package:flutter/material.dart';
import '../apiDataSource.dart';
// Import the url_launcher package

class DetailAgent extends StatefulWidget {
  final String agentId;

  const DetailAgent({Key? key, required this.agentId}) : super(key: key);

  @override
  _DetailAgentState createState() => _DetailAgentState();
}

class _DetailAgentState extends State<DetailAgent> {
  late Future<AgentResponse> futureAgent;

  @override
  void initState() {
    super.initState();
    futureAgent = ApiDataSource.instance.loadAgentDetail(widget.agentId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Agent Detail"),
      ),
      body: FutureBuilder<AgentResponse>(
        future: futureAgent,
        builder: (BuildContext context, AsyncSnapshot<AgentResponse> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error loading agent detail"),
            );
          } else if (snapshot.hasData) {
            return _buildMealDetail(snapshot.data!.dataAgent[0]);
          } else {
            return Center(
              child: Text("No data available"),
            );
          }
        },
      ),
    );
  }

  Widget _buildMealDetail(Agent agent) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            agent.fullPortrait,
            width: double.infinity,
            height: 200,
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
                SizedBox(height: 8),
                Text(
                  agent.description,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 8),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
