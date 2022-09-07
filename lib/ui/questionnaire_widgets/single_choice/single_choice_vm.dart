import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../models/get_questionnaire_model.dart';

class SingleChoiceViewModel extends BaseViewModel {
  String v = '';
  Answers? answer;

  final Function(Answers answer) callBack;
  late StreamController<String> controller;

  SingleChoiceViewModel(this.callBack, this.controller) {
    controller.stream.listen((String data) {
      if (answer == null) {
        debugPrint('Error');
        return;
      }

      if (data == 'GetData' && answer != null) {
        callBack(answer!);
      }
    });
  }

  onRadioBtn(String? value, int i, GetQuestionnaire questionnaire) {
    // v = value!;
    questionnaire.selectedOption![0] = value!;
    List<Options>? options = questionnaire.options;
    List<String>? option = options!
        .map((op) {
          return op.option;
        })
        .cast<String>()
        .toList();
    List<String> optionsss = [value];
    answer = Answers(
        questionId: questionnaire.questionId,
        question: questionnaire.question,
        answerType: questionnaire.answerType,
        options: option,
        selectedOption: optionsss);
    notifyListeners();
  }
}
