abstract class AbstractPlayer {
  Future<void> playSound(int i);
  Future<void> playSoundClean(int i);
  Future<void> stopSound(int i);
  Future<void> stopAllSounds();
}
