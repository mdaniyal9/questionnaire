import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../../models/get_questionnaire_model.dart';

class MultiChoiceViewModel extends BaseViewModel{
  List<String> selectedOptions = [];
  Answers? answer;

  final Function(Answers answer) callBack;
  late StreamController<String> controller;

  MultiChoiceViewModel(this.callBack, this.controller){
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
    onClickCheckBox( GetQuestionnaire questionnaire, int index, v, ){
      if (v == true){
      questionnaire.options![index].isCheck = v!;
      List<Options>? options = questionnaire.options;
      List<String>? option = options!
          .map((op) {
        return op.option;
      })
          .cast<String>()
          .toList();

      if(!isDataExist(questionnaire.options![index].option!)){
        selectedOptions.add(questionnaire.options![index].option!);
      };
      answer = Answers(question: questionnaire.question, answerType : questionnaire.answerType, selectedOption : selectedOptions, options: option);
    }else{
        questionnaire.options![index].isCheck = v!;
        List<Options>? options = questionnaire.options;
        List<String>? option = options!
            .map((op) {
          return op.option;
        })
            .cast<String>()
            .toList();
        if(isDataExist(questionnaire.options![index].option!)){
          selectedOptions.remove(questionnaire.options![index].option!);
        };
        answer = Answers(question: questionnaire.question, answerType : questionnaire.answerType, selectedOption : selectedOptions, options: option);
      }

    notifyListeners();
  }

bool isDataExist(String value) {
  // var data = answers.where((row) => (answers.contains(value)));
  var data = selectedOptions.where((row) => (selectedOptions.contains(value)));
  if (data.length >= 1) {
    return true;
  } else {
    return false;
  }
}

}