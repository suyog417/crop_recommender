import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';

class RecentRecommendations extends StatelessWidget {
  const RecentRecommendations({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recent"),
      ),
      body:Hive.box("Recents").isEmpty ? const Center(child: Text("Nothing to show here."),) :
      ListView.builder(
        itemCount: Hive.box("Recents").length,
        itemBuilder: (context, index) {
          final curr = Hive.box("Recents").getAt(index);
        return ListTile(
          title: Text(DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.parse(curr['date'])),style: TextStyle(fontSize: Theme.of(context).textTheme.titleLarge!.fontSize,fontWeight: FontWeight.w800,),),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Nitrogen : ${curr['inputs'][0]}"),
              Text("Phosphorus : ${curr['inputs'][1]}"),
              Text("Potassium : ${curr['inputs'][2]}"),
              Text("pH : ${curr['inputs'][3]}"),
              Text("Rainfall : ${curr['inputs'][4]}"),
              Text("Temperature : ${curr['inputs'][5]} ℃"),
              Divider(),
            ],
          ),
          trailing: Text(curr['output'],style: TextStyle(fontSize: Theme.of(context).textTheme.titleLarge!.fontSize,fontWeight: FontWeight.w800,)),
        );
      },),
    );
  }
}
