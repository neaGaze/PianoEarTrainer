import "package:flutter/material.dart";
import 'package:piano_ear_trainer/widgets/AppDrawer.dart';

class IntervalExercisePage extends StatefulWidget {
  IntervalExercisePage({Key key, this.title}) : super(key: key);

  static const String routeInterval = "interval"; // const used at compile time
  final String title; // final used at runtime

  @override
  _IntervalExercisePageState createState() => _IntervalExercisePageState();
}

class _IntervalExercisePageState extends State<IntervalExercisePage> {
  String _title;

  @override
  void initState() {
    super.initState();
    this._title =
        "Interval Exercise"; //widget.title != null ? widget.title : "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, isInnerBoxScrolled) {
          return <Widget>[
            SliverAppBar(
                expandedHeight: 200,
                floating: true,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                    title: Text("Interval Exercise"),
                    background: Image.asset("assets/piano.jpg")))
          ];
        },
        body: Center(
          child: Text("This is the interval exercise section"),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
      drawer: AppDrawer(),
    );
  }
}

/*
appBar: AppBar(
        title: Text(_title),
      ),
      body: Center(child: Text("This is the interval exercise section")),
 */
