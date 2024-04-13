import 'dart:convert';
// import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:sklite/ensemble/forest.dart';

// runModel() async {
//   final interpreter =
//       await tfl.Interpreter.fromAsset("assets/crop_recomm.tflite");
//
//   final input = [
//     [112.89, 2.956, 600.32, 31, 19, 8.7, 0]
//   ];
//
//   var output = List.filled(1, 0).reshape([1, 1]);
//
//   interpreter.run(input, output);
//
//   if (kDebugMode) {
//     print(output);
//   }
// }

const List<String> cropNames = [
  'Sugarcane',
  'Wheat',
  'Cotton',
  'Jowar',
  'Maize',
  'Rice',
  'Groundnut',
  'Tur',
  'Ginger',
  'Grapes',
  'Urad',
  'Moong',
  'Gram',
  'Turmeric',
  'Soybean',
  'Masoor'
];

RandomForestClassifier? rfc;

Future<void> readJson() async {
  final String response =
      await rootBundle.loadString('assets/crop_recomm_json.json');
  final data = await json.decode(response);
  // print(data);
  rfc = RandomForestClassifier.fromMap(data);
}
