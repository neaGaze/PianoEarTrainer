import 'package:piano_ear_trainer/models/TrainingCategory.dart';
import 'package:piano_ear_trainer/services/AudioPlayer.dart';
import 'package:piano_ear_trainer/services/UnitFactory.dart';

abstract class Unit {
  String name();
  void play();
  void stop();
  int rootPosition();
  bool isSameUnit(Unit unit);
}

abstract class IntervalUnit implements Unit {
  AudioPlayer audioPlayer;
  int notePosition;

  IntervalUnit.forNaming();
  IntervalUnit(AudioPlayer audioPlayer, int notePosition) {
    this.audioPlayer = audioPlayer;
    this.notePosition = notePosition;
  }
}

class UnisonIntervalUnit extends IntervalUnit {
  UnisonIntervalUnit.forNaming() : super.forNaming();
  UnisonIntervalUnit(AudioPlayer audioPlayer, int pos)
      : super(audioPlayer, pos);
  @override
  void play() {
    audioPlayer.playSoundClean(notePosition + 0);

    Future.delayed(Duration(seconds: 1), () {
      audioPlayer.playSound(notePosition);
    });
  }

  @override
  void stop() {
    audioPlayer.stopSound(notePosition);
  }

  @override
  String name() {
    return "Unison";
  }

  @override
  int rootPosition() {
    return notePosition;
  }

  @override
  bool isSameUnit(Unit unit) {
    return unit is UnisonIntervalUnit;
  }
}

class MajorThirdIntervalUnit extends IntervalUnit {
  MajorThirdIntervalUnit.forNaming() : super.forNaming();
  MajorThirdIntervalUnit(AudioPlayer audioPlayer, int pos)
      : super(audioPlayer, pos);
  void play() {
    audioPlayer.playSoundClean(notePosition);

    Future.delayed(Duration(seconds: 1), () {
      audioPlayer.playSound(notePosition + 4);
    });
  }

  @override
  void stop() {
    audioPlayer.stopSound(notePosition);
    audioPlayer.stopSound(notePosition + 4);
  }

  @override
  String name() {
    return "M3";
  }

  @override
  int rootPosition() {
    return notePosition;
  }

  @override
  bool isSameUnit(Unit unit) {
    return unit is MajorThirdIntervalUnit;
  }
}

class MinorThirdIntervalUnit extends IntervalUnit {
  MinorThirdIntervalUnit.forNaming() : super.forNaming();
  MinorThirdIntervalUnit(AudioPlayer audioPlayer, int pos)
      : super(audioPlayer, pos);
  void play() {
    audioPlayer.playSoundClean(notePosition);

    Future.delayed(Duration(seconds: 1), () {
      audioPlayer.playSound(notePosition + 3);
    });
  }

  @override
  void stop() {
    audioPlayer.stopSound(notePosition);
    audioPlayer.stopSound(notePosition + 3);
  }

  @override
  String name() {
    return "m3";
  }

  @override
  int rootPosition() {
    return notePosition;
  }

  @override
  bool isSameUnit(Unit unit) {
    return unit is MinorThirdIntervalUnit;
  }
}

class OctaveIntervalUnit extends IntervalUnit {
  OctaveIntervalUnit.forNaming() : super.forNaming();
  OctaveIntervalUnit(AudioPlayer audioPlayer, int pos)
      : super(audioPlayer, pos);
  void play() {
    audioPlayer.playSoundClean(notePosition);

    Future.delayed(Duration(seconds: 1), () {
      audioPlayer.playSound(notePosition + 13);
    });
  }

  @override
  void stop() {
    audioPlayer.stopSound(notePosition);
    audioPlayer.stopSound(notePosition + 13);
  }

  @override
  String name() {
    return "P8";
  }

  @override
  int rootPosition() {
    return notePosition;
  }

  @override
  bool isSameUnit(Unit unit) {
    return unit is OctaveIntervalUnit;
  }
}

class TrainingType {
  TrainingCategory trainingCategory;
  List<UnitFactory> units;

  TrainingType(TrainingCategory trainingCategory, List<UnitFactory> units) {
    this.trainingCategory = trainingCategory;
    this.units = units;
  }
}
