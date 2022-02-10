import 'package:flutter/material.dart';
import 'package:ara_optical_app/const.dart';
import 'screen/splashscreen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: kBackgroundColor,
        primaryColor: kPrimayColor,
        primarySwatch: Colors.red,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      darkTheme: ThemeData.dark(),
      title: 'Ara Optical',
      home: const Scaffold(
        body: SplashPage(),
      ),
    );
  }
}

