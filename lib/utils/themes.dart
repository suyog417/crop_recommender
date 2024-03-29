import 'package:flutter/material.dart';

class AppTheme {
  textColor(BuildContext context) {
    return Theme.of(context).textTheme.bodyLarge!.color;
  }

  contentPadding(BuildContext context) {
    return EdgeInsets.all(MediaQuery.sizeOf(context).height * 0.02);
  }

  borderRadius(BuildContext context) {
    return BorderRadius.circular(MediaQuery.sizeOf(context).width * 0.02);
  }

  screenPadding(BuildContext context) {
    return EdgeInsets.symmetric(
        vertical: MediaQuery.sizeOf(context).height * 0.03,
        horizontal: MediaQuery.sizeOf(context).width * 0.03);
  }

  ThemeData lightTheme(BuildContext context) {
    return ThemeData.light(useMaterial3: true).copyWith(
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        textTheme: Theme.of(context).textTheme.apply(displayColor: Colors.black,bodyColor: Colors.black),
        filledButtonTheme: FilledButtonThemeData(
            style: FilledButton.styleFrom(
                backgroundColor: Colors.black, foregroundColor: Colors.white)));
  }

  ThemeData darkTheme(BuildContext context) {
    return ThemeData.dark(useMaterial3: true).copyWith(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
      primaryColor: Colors.white,
      primaryColorDark: Colors.white,
      textTheme: Theme.of(context).textTheme.apply(displayColor: Colors.white,bodyColor: Colors.white),
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black, foregroundColor: Colors.white),
      listTileTheme: ListTileThemeData(
        textColor: Colors.white
      ),
      brightness: Brightness.dark,
      canvasColor: Colors.black,
      scaffoldBackgroundColor: Colors.black,
      filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
              backgroundColor: Colors.white, foregroundColor: Colors.black)),
    );
  }
}
