import 'package:flutter/foundation.dart';
import 'package:tflite_flutter/tflite_flutter.dart' as tfl;

runModel() async{
  final interpreter = await tfl.Interpreter.fromAsset("assets/crop_recomm.tflite");

  final input = [[112.89,2.956,600.32,31,19,8.7,0]];

  var output = List.filled(1, 0).reshape([1,1]);

  interpreter.run(input,output);

  if (kDebugMode) {
    print(output);
  }
}