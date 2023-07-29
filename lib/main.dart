import 'package:carbonsense/models/carbon_footprint.dart';
import 'package:carbonsense/screens/calculator.dart';
import 'package:carbonsense/screens/home_navigator.dart';
import 'package:carbonsense/screens/homepage.dart';
import 'package:carbonsense/theme/constants/colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorSchemeSeed: kDarkGreen,
        useMaterial3: true,
        sliderTheme: const SliderThemeData(
          showValueIndicator: ShowValueIndicator.always,
        ),
      ),
      home: const HomeNavigator(),
    );
  }
}
