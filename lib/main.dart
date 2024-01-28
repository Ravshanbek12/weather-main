import 'package:flutter/material.dart';
import 'package:weather/core/injector/injector.dart';

import 'package:weather/features/weather/presentation/pages/weather_basic.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WeatherBasicScreen(),
    );
  }
}

