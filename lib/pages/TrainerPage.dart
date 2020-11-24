import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:piano_ear_trainer/services/AudioPlayer.dart';

class TrainerPage extends StatefulWidget {
  static const String routeTrainer = "route-trainer";
  final String title;
  AudioPlayer audioPlayer;

  TrainerPage({Key key, this.title}) : super(key: key);

  @override
  _TrainerPageState createState() => _TrainerPageState();
}

class _TrainerPageState extends State<TrainerPage> {
  void initState() {
    super.initState();
    widget.audioPlayer = AudioPlayer();
    widget.audioPlayer.loadSounds();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Center(
        child: Row(
          children: [
            RaisedButton(
                textColor: Colors.greenAccent,
                child: Text("Start"),
                onPressed: () {
                  widget.audioPlayer.playSound(20);
                }),
            RaisedButton(
                textColor: Colors.redAccent,
                child: Text("Stop"),
                onPressed: () {
                  widget.audioPlayer.stopSound(20);
                })
          ],
        ),
      ),
    );
  }
}
