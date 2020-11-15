import 'package:flutter/material.dart';
import 'package:piano_ear_trainer/pages/ChordsExercisePage.dart';
import 'package:piano_ear_trainer/pages/IntervalExercisePage.dart';
import 'package:piano_ear_trainer/pages/ScaleExercisePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: IntervalExercisePage(title: 'Ear Trainer'),
      routes: {
        IntervalExercisePage.routeInterval: (context) => IntervalExercisePage(
              title: "Interval Exercise",
            ),
        ChordsExercisePage.routeChords: (context) =>
            ChordsExercisePage(title: "Chords Exercise"),
        ScaleExercisePage.routeScale: (context) =>
            ScaleExercisePage(title: "Scale Exercise"),
      },
    );
  }
}
