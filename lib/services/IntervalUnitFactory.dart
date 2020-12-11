import 'package:piano_ear_trainer/models/TrainingType.dart';
import 'package:piano_ear_trainer/services/AudioPlayer.dart';
import 'package:piano_ear_trainer/services/UnitFactory.dart';

class UnisonIntervalUnitFactory implements UnitFactory {
  @override
  Unit Create(int notePosition) {
    return UnisonIntervalUnit(new AudioPlayer(), notePosition);
  }

  @override
  String Name() {
    return "Unison";
  }
}

class MajorThirdIntervalUnitFactory implements UnitFactory {
  @override
  Unit Create(int notePosition) {
    return MajorThirdIntervalUnit(new AudioPlayer(), notePosition);
  }

  @override
  String Name() {
    return "M3";
  }
}

class MinorThirdIntervalUnitFactory implements UnitFactory {
  @override
  Unit Create(int notePosition) {
    return MinorThirdIntervalUnit(new AudioPlayer(), notePosition);
  }

  @override
  String Name() {
    return "m3";
  }
}

class OctaveIntervalUnitFactory implements UnitFactory {
  @override
  Unit Create(int notePosition) {
    return OctaveIntervalUnit(new AudioPlayer(), notePosition);
  }

  @override
  String Name() {
    return "P8";
  }
}
