import 'package:flutter/material.dart';
import 'package:piano_ear_trainer/widgets/AppDrawer.dart';

class ScaleExercisePage extends StatefulWidget {
  ScaleExercisePage({Key key, this.title}) : super(key: key);

  static const String routeScale = "scale"; // const used at compile time
  final String title; // final used at runtime

  @override
  _ScaleExercisePageState createState() => _ScaleExercisePageState();
}

class _ScaleExercisePageState extends State<ScaleExercisePage> {
  String _title;

  @override
  void initState() {
    super.initState();
    this._title = "Scale Exercise"; //widget.title != null ? widget.title : "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: Center(child: Text("This is the Scale exercise section")),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
      drawer: AppDrawer(),
    );
  }
}
