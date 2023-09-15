import 'package:flutter/material.dart';

import 'weather_forecast/ui_homepage/weather_forecast.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: WeatherForcast(),
    );
  }
}

