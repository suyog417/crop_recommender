import 'package:flutter/material.dart';

class RecentRecommendations extends StatelessWidget {
  const RecentRecommendations({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recent"),
      ),
      body: const Center(
        child: Text("Nothing to show here"),
      ),
    );
  }
}
