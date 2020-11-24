import "package:flutter/material.dart";
import 'package:piano_ear_trainer/models/ExerciseDataModel.dart';
import 'package:piano_ear_trainer/pages/TrainerPage.dart';
import 'package:piano_ear_trainer/widgets/AppDrawer.dart';
import 'package:piano_ear_trainer/widgets/ExerciseListTile.dart';

class IntervalExercisePage extends StatefulWidget {
  IntervalExercisePage({Key key, this.title}) : super(key: key);

  static const String routeInterval = "interval"; // const used at compile time
  final String title; // final used at runtime
  final List<ExerciseDataModel> exerciseDataModels =
      new List<ExerciseDataModel>();

  @override
  _IntervalExercisePageState createState() => _IntervalExercisePageState();
}

class _IntervalExercisePageState extends State<IntervalExercisePage> {
  @override
  void initState() {
    super.initState();
    widget.exerciseDataModels
        .add(ExerciseDataModel("Unison, m3, M3, Octave", "Ascending", 0.2, () {
      Navigator.pushNamed(context, TrainerPage.routeTrainer);
    }));
    widget.exerciseDataModels.add(
        ExerciseDataModel("Unison, m3, M3, Octave", "Descending", 0.7, () {}));
    widget.exerciseDataModels
        .add(ExerciseDataModel("P4, P5", "Ascending", 0.9, () {}));
    widget.exerciseDataModels
        .add(ExerciseDataModel("P4, P5", "Descending", 0.12, () {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (context, isInnerBoxScrolled) {
            return <Widget>[
              SliverAppBar(
                  expandedHeight: 180,
                  floating: true,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                      title: Text("Interval Exercise"),
                      background: Image.asset("assets/piano.jpg")))
            ];
          },
          body: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Container(
                color: Color.fromRGBO(200, 200, 200, 0.4),
              ),
              ListView.builder(
                  itemBuilder: (context, index) {
                    return new ExerciseListTile(
                      title: widget.exerciseDataModels[index]
                          .title, //"Unison, m3, M3, Octave",
                      subtitle: widget.exerciseDataModels[index].subtitle,
                      completionPercent:
                          widget.exerciseDataModels[index].completionPercent,
                      onTap: widget.exerciseDataModels[index].onTap,
                    );
                  },
                  itemCount: widget.exerciseDataModels.length),
            ],
          )),
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
