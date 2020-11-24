class SoundStatus {
  String filename;
  int soundId;
  int soundStreamId;

  SoundStatus({String filename, int soundId, int soundStreamId}) {
    this.filename = filename;
    this.soundId = soundId;
    this.soundStreamId = soundStreamId;
  }
}
