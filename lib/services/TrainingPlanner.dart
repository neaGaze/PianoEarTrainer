import 'dart:collection';
import 'dart:math';

import 'package:piano_ear_trainer/models/TrainingType.dart';
import 'package:piano_ear_trainer/services/AudioPlayer.dart';

class TrainingPlanner {
  int size;
  TrainingType trainingType;
  HashMap<int, Unit> trainingSet;

  TrainingPlanner(TrainingType trainingType, int size) {
    this.size = size;
    this.trainingType = trainingType;
    this.trainingSet = new HashMap<int, Unit>();
  }

  HashMap<int, Unit> generateTrainMaterial() {
    Random random = new Random();
    AudioPlayer audioPlayer = AudioPlayer();
    for (int i = 0; i < size; i++) {
      trainingSet[i] = unitSelector(
          audioPlayer,
          random.nextInt(audioPlayer.soundMap.length -
              13)); // since we want to try sampling one octave lower
    }
    return trainingSet;
  }

  Unit unitSelector(AudioPlayer audioPlayer, int randomNoteSelector) {
    Random randomVariation = new Random();
    int variation = randomVariation.nextInt(trainingType.units.length);
    return trainingType.units[variation].Create(randomNoteSelector);
  }

  void playSoundFor(int trainingSetPosition, int index) {}
}
