import 'package:flutter/material.dart';
import 'package:piano_ear_trainer/widgets/AppDrawer.dart';

class ChordsExercisePage extends StatefulWidget {
  ChordsExercisePage({Key key, this.title}) : super(key: key);

  static const String routeChords = "chords"; // const used at compile time
  final String title;

  @override
  _ChordsExercisePageState createState() => _ChordsExercisePageState();
}

class _ChordsExercisePageState extends State<ChordsExercisePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chords Exercise")),
      body: Center(
        child: Center(
          child: Text("This is the Chords Exercise Page"),
        ),
      ),
      drawer: AppDrawer(),
    );
  }
}
