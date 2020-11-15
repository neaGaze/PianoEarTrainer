import 'package:flutter/material.dart';
import 'package:piano_ear_trainer/pages/ChordsExercisePage.dart';
import 'package:piano_ear_trainer/pages/IntervalExercisePage.dart';
import 'package:piano_ear_trainer/pages/ScaleExercisePage.dart';

enum DrawerStates { INTERVAL, CHORDS, SCALE }

class AppDrawer extends StatefulWidget {
  final DrawerStates currentSelection;

  AppDrawer({Key key, this.currentSelection}) : super(key: key);

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  DrawerStates _curState;

  @override
  void initState() {
    super.initState();
    _curState = widget.currentSelection;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(
              "Exercises",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87),
            ),
            accountEmail: Text(""),
          ),
          ListTile(
            leading: Icon(Icons.sanitizer),
            onTap: () {
              Navigator.pushReplacementNamed(
                  context, IntervalExercisePage.routeInterval);
            },
            title: Text("Interval Recognition"),
          ),
          ListTile(
            leading: Icon(Icons.charging_station_rounded),
            title: Text("Chords Recognition"),
            onTap: () {
              Navigator.pushReplacementNamed(
                  context, ChordsExercisePage.routeChords);
            },
          ),
          ListTile(
            leading: Icon(Icons.linear_scale_sharp),
            title: Text("Scale Recognition"),
            onTap: () {
              Navigator.pushReplacementNamed(
                  context, ScaleExercisePage.routeScale);
            },
          ),
        ],
      ),
    );
  }
}
