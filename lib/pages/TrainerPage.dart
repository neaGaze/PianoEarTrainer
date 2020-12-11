import 'dart:collection';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:piano_ear_trainer/models/TrainingType.dart';
import 'package:piano_ear_trainer/services/AudioPlayer.dart';
import 'package:piano_ear_trainer/services/AudioPlayerDriver.dart';
import 'package:piano_ear_trainer/services/UnitFactory.dart';

class TrainerPage extends StatefulWidget {
  static const String routeTrainer = "route-trainer";
  final String title;
  AudioPlayer audioPlayer;

  TrainerPage({Key key, this.title}) : super(key: key);

  @override
  _TrainerPageState createState() => _TrainerPageState();
}

class _TrainerPageState extends State<TrainerPage> {
  bool _isStart;
  HashMap<int, Unit> trainingMaterial;
  HashMap<Unit, bool> options;
  List<Unit> optionsOrder;
  AudioPlayerDriver trainingPlanner;
  int _curPlayingIndex;
  HashSet<int> playedUnitCollection;
  int _pointsScored;
  List<Color> _buttonColor;

  void initState() {
    super.initState();
    widget.audioPlayer = AudioPlayer();
    widget.audioPlayer.loadSounds();
    trainingMaterial = HashMap<int, Unit>();
    options = HashMap<Unit, bool>();
    optionsOrder = List<Unit>();
    playedUnitCollection = new HashSet();
    _isStart = true;
    _buttonColor = List<Color>();
  }

  void startTraining() {
    setState(() {
      _isStart = false;
      _curPlayingIndex = 0;
      _pointsScored = 0;

      if (trainingPlanner != null) {
        trainingMaterial =
            trainingPlanner.generateTrainMaterial(); // get the training dataset

        Unit unit = trainingMaterial[_curPlayingIndex];

        // get the options
        for (UnitFactory optionFactory in trainingPlanner.trainingType.units) {
          int notePosition = trainingMaterial[_curPlayingIndex].rootPosition();
          Unit option = optionFactory.Create(notePosition);
          options[option] = option.isSameUnit(unit);
          optionsOrder.add(option);
          _buttonColor.add(Colors.blue);
        }

        unit.play();
      } else
        log("Err: Training Planner is null. ");
    });
  }

  void itemClicked(int optionOrderClicked) {
    // get access to the Option unit
    Unit optionUnit = optionsOrder[
        optionOrderClicked]; // unitFactory.Create(trainingMaterial[_curPlayingIndex].rootPosition());

    if (!playedUnitCollection.contains(_curPlayingIndex)) {
      setState(() {
        if (options[optionUnit]) {
          _buttonColor[optionOrderClicked] = Colors.greenAccent;
          _pointsScored += 1;
        } else {
          _buttonColor[optionOrderClicked] = Colors.redAccent;
          for (int i = 0; i < optionsOrder.length; i++) {
            if (options[optionsOrder[i]]) _buttonColor[i] = Colors.greenAccent;
          }
        }

        log("Game Points Scored: $_pointsScored");
      });

      playedUnitCollection.add(_curPlayingIndex);
    }
    log("Game playing note Position :${optionUnit.rootPosition()}");
    optionUnit.play();
  }

  void gotoNext() {
    setState(() {
      _curPlayingIndex += 1;

      Unit unit = trainingMaterial[_curPlayingIndex];

      // get the options
      options.clear();
      for (int j = 0; j < trainingPlanner.trainingType.units.length; j++) {
        int notePosition = trainingMaterial[_curPlayingIndex].rootPosition();
        UnitFactory optionFactory = trainingPlanner.trainingType.units[j];
        Unit option = optionFactory.Create(notePosition);
        options[option] = option.isSameUnit(unit);
        optionsOrder[j] = option;
        _buttonColor[j] = Colors.blue;
      }

      unit.play();
    });
  }

  void replay() {
    trainingMaterial[_curPlayingIndex].play();
  }

  @override
  Widget build(BuildContext context) {
    trainingPlanner = ModalRoute.of(context).settings.arguments;

    return new Scaffold(
        appBar: AppBar(
          title: Text("Training"),
        ),
        body: Column(
          children: <Widget>[
            Container(
              height: 80,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Colors.blue,
                  boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 10)],
                  borderRadius: BorderRadius.circular(0)),
              child: Row(children: [
                Container(
                  width: 20,
                ),
                Container(
                  padding: const EdgeInsets.all(6),
                  child: Column(
                    children: [
                      Expanded(child: Text("17 / 4")),
                      Text("Elapsed Time: 0:04 sec"),
                      Text("Average Time: 0:01 sec")
                    ],
                  ),
                )
              ]),
            ),
            Expanded(
              child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(color: Colors.grey, blurRadius: 10)
                      ],
                      borderRadius: BorderRadius.circular(0)),
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      // return card
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RaisedButton(
                              textColor: Colors.white,
                              color: _buttonColor[index],
                              onPressed: () {
                                itemClicked(index);
                              },
                              child: Text(optionsOrder[index].name())),
                        ),
                      );
                    },
                    itemCount: options.length,
                  )),
            ),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Colors.blue,
                  boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 10)],
                  borderRadius: BorderRadius.circular(0)),
              child: Center(
                  child: Column(
                children: [
                  Visibility(
                      visible: _isStart,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RaisedButton(
                              textColor: Colors.white,
                              child: Text("Start"),
                              color: Colors.greenAccent,
                              onPressed: startTraining)
                        ],
                      )),
                  Visibility(
                    visible: !_isStart,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RaisedButton(
                            textColor: Colors.white,
                            child: Text("Next"),
                            color: Colors.greenAccent,
                            onPressed: gotoNext),
                        SizedBox(
                          width: 30,
                        ),
                        RaisedButton(
                            textColor: Colors.white,
                            child: Text("Replay"),
                            color: Colors.blueAccent,
                            onPressed: replay),
                        SizedBox(
                          width: 30,
                        ),
                        RaisedButton(
                            textColor: Colors.white,
                            child: Text("Stop"),
                            color: Colors.redAccent,
                            onPressed: () {
                              trainingPlanner.stopAllSounds();
                            })
                      ],
                    ),
                  ),
                ],
              )),
            ),
          ],
        ));
  }
}
