import 'package:piano_ear_trainer/models/TrainingType.dart';

abstract class UnitFactory {
  Unit Create(int pos);
  String Name();
}
