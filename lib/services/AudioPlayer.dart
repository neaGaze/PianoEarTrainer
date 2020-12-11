import 'dart:collection';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:piano_ear_trainer/models/SoundStatus.dart';
import 'package:piano_ear_trainer/services/AbstractPlayer.dart';
import 'package:soundpool/soundpool.dart';

class AudioPlayer implements AbstractPlayer {
  static final AudioPlayer _instance = AudioPlayer._internal(
      soundpool: Soundpool()); // streamType: StreamType.notification

  final Soundpool soundpool;
  HashMap soundMap;
  var soundId, _soundStreamId;

  factory AudioPlayer() {
    return _instance;
  }

  AudioPlayer._internal({this.soundpool}) {
    soundMap = HashMap<int, SoundStatus>();
    soundMap[0] = SoundStatus(filename: "a-1.mp3");
    soundMap[1] = SoundStatus(filename: "as-1.mp3");
    soundMap[2] = SoundStatus(filename: "b-1.mp3");
    soundMap[87] = SoundStatus(filename: "c7.mp3");

    for (var i = 0; i < 7; i++) {
      soundMap[i * 12 + 3] = SoundStatus(filename: "c$i.mp3");
      soundMap[i * 12 + 4] = SoundStatus(filename: "cs$i.mp3");
      soundMap[i * 12 + 5] = SoundStatus(filename: "d$i.mp3");
      soundMap[i * 12 + 6] = SoundStatus(filename: "ds$i.mp3");
      soundMap[i * 12 + 7] = SoundStatus(filename: "e$i.mp3");
      soundMap[i * 12 + 8] = SoundStatus(filename: "f$i.mp3");
      soundMap[i * 12 + 9] = SoundStatus(filename: "fs$i.mp3");
      soundMap[i * 12 + 10] = SoundStatus(filename: "g$i.mp3");
      soundMap[i * 12 + 11] = SoundStatus(filename: "gs$i.mp3");
      soundMap[i * 12 + 12] = SoundStatus(filename: "a$i.mp3");
      soundMap[i * 12 + 13] = SoundStatus(filename: "as$i.mp3");
      soundMap[i * 12 + 14] = SoundStatus(filename: "b$i.mp3");
    }
  }

  Future<void> loadSounds() async {
    for (var key in soundMap.keys) {
      SoundStatus soundStatus = soundMap[key] as SoundStatus;
      ByteData asset = await rootBundle
          .load("assets/Steinway_Grand/" + soundStatus.filename);
      soundStatus.soundId = await soundpool.load(asset);
    }
  }

  @override
  Future<void> playSound(int i) async {
    if (soundMap.containsKey(i)) {
      SoundStatus soundStatus = soundMap[i] as SoundStatus;
      // soundStatus.soundId = await soundStatus.soundId;
      soundStatus.soundStreamId = await soundpool.play(soundStatus.soundId);
      log("playing sound started");
    }
  }

  @override
  Future<void> stopSound(int i) async {
    if (soundMap.containsKey(i)) {
      SoundStatus soundStatus = soundMap[i] as SoundStatus;

      if (soundStatus.soundStreamId != null) {
        await soundpool.stop(soundStatus.soundStreamId);
        log("Sound playing stopped");
      }
    }
  }

  @override
  Future<void> stopAllSounds() async {
    for (var key in soundMap.keys) {
      SoundStatus soundStatus = soundMap[key] as SoundStatus;
      if (soundStatus.soundStreamId != null) {
        await soundpool.stop(soundStatus.soundStreamId);
        log("All playing Sound playing stopped");
      }
    }
  }

  @override
  Future<void> playSoundClean(int i) async {
    await stopAllSounds();
    await playSound(i);
  }
}
