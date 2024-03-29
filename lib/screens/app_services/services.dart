import 'package:crop_recomm/screens/app_services/crop_recommendations.dart';
import 'package:crop_recomm/screens/app_services/crop_wiki_service.dart';
import 'package:crop_recomm/screens/app_services/news_service.dart';
import 'package:crop_recomm/screens/app_services/weather_service.dart';
import 'package:flutter/material.dart';

class Services extends StatefulWidget {
  const Services({super.key});

  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services> {

  Map serv = {
    "News": const NewsService(),
    "Crop Wikipedia" : const CropWiki(),
    "Weather Updates" : const WeatherUpdates(),
    "Crop Recommendations" : const RecommService()
  };
  List<String> labels = ["News","Crop Wikipedia",'Weather Updates','Crop Recommendations'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Services"),elevation: 0.5,),
      body: ListView.builder(
        itemCount: serv.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
        return ListTile(
          title: Text(serv.keys.elementAt(index)),
          trailing: const Icon(Icons.arrow_forward),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return serv[labels.elementAt(index)];
            }));
          },
        );
      },),
    );
  }
}
