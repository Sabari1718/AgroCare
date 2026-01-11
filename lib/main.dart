import 'package:agrocare/intro_pageview.dart';
import 'package:agrocare/weather_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/weather_provider.dart';
import 'screens/intro_pageview.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => WeatherProvider(),
      child:  MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "AgroCare 🌾",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "AgroFont",
        primarySwatch: Colors.green,
      ),
      home: IntroPageView(),
    );
  }
}
