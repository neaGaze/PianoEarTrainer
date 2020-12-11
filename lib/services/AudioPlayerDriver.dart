import 'package:piano_ear_trainer/models/TrainingType.dart';
import 'package:piano_ear_trainer/services/AbstractPlayer.dart';
import 'package:piano_ear_trainer/services/AudioPlayer.dart';
import 'package:piano_ear_trainer/services/TrainingPlanner.dart';

class AudioPlayerDriver extends TrainingPlanner implements AbstractPlayer {
  AudioPlayer audioPlayer;

  AudioPlayerDriver(TrainingType trainingType, int size)
      : super(trainingType, size) {
    audioPlayer = AudioPlayer();
  }

  @override
  Future<void> playSound(int rootNote) async {
    trainingSet[rootNote].play();
  }

  @override
  Future<void> stopSound(int rootNote) async {
    trainingSet[rootNote].stop();
  }

  @override
  void playSoundFor(int trainingSetPosition, int index) {
    trainingType.units[index].Create(trainingSetPosition).play();
  }

  @override
  Future<void> stopAllSounds() async {
    await audioPlayer.stopAllSounds();
  }

  @override
  Future<void> playSoundClean(int i) async {
    await stopAllSounds();
  }
}
