import 'package:flutter/material.dart';

class ExerciseDataModel {
  String title;
  String subtitle;
  double completionPercent;
  VoidCallback onTap;

  ExerciseDataModel(String title, String subtitle, double completionPercent,
      VoidCallback onTap) {
    this.title = title;
    this.subtitle = subtitle;
    this.completionPercent = completionPercent;
    this.onTap = onTap;
  }
}
