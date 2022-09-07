import 'package:flutter/material.dart';
import 'package:questionnaire/ui/questionnaire_vu.dart';

void main() {
  runApp(
    const MaterialApp(
      home: SafeArea(
        child: QuestionnaireVU(),
      ),
    ),
  );
}
