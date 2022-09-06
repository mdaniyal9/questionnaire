import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../models/get_questionnaire_model.dart';

class QuestionnaireViewModel extends BaseViewModel {
  List<Answers> answers = [];
  List<GetQuestionnaire> questions = [];
  FocusNode focus = FocusNode();
  final notificationController = StreamController<String>.broadcast();

  QuestionnaireViewModel() {
    questions.add(GetQuestionnaire('ID', 'AP-ID', 'What is Your Problem?',
        'single_line', null, null, null));
    questions.add(GetQuestionnaire('ID1', 'AP-ID1', 'What is Your Problem?1',
        'multi_line', null, null, null));
    questions.add(GetQuestionnaire(
        'ID2',
        'AP-ID2',
        'What is Your Problem?2',
        'single_choice',
        null,
        [Options('Yes', false), Options('No', false)],
        null));
  }

  onAddToList(Answers value) {
    // if (!isDataExist(value)) {
    //   answers.add(value);
    // }
    answers.removeWhere((row) => (row.questionId == value.questionId));
    answers.add(value);
    for (var answer in answers) {
      debugPrint('${answer.answer}-------> ${answer.selectedOption}');
    }
    debugPrint('\n');
  }

  // bool isDataExist(Answers value) {
  //   // var data = answers.where((row) => (answers.contains(value)));
  //   var data = answers.where((row) => (answers.contains(value)));
  //   if (data.length >= 1) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }
}
