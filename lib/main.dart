import 'package:crop_recomm/firebase_options.dart';
import 'package:crop_recomm/screens/home.dart';
import 'package:crop_recomm/screens/on_boading/intro.dart';
import 'package:crop_recomm/screens/on_boading/signInBloc.dart';
import 'package:crop_recomm/utils/themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox("UserData");
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final box = Hive.box("UserData");
  AppTheme appTheme = AppTheme();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: kDebugMode,
        theme: appTheme.lightTheme(context),
        darkTheme: appTheme.darkTheme(context),
        themeMode: ThemeMode.system,
        home: ValueListenableBuilder(
          valueListenable: Hive.box("UserData").listenable(),
          builder: (context, box, child) {
            if (box.get("isLoggedIn", defaultValue: false)) {
              return const Home();
            } else {
              return const Introduction();
            }
          },
        ),
      ),
    );
  }
}
