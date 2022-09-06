import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../models/get_questionnaire_model.dart';
import 'multi_choice_vm.dart';

class MultiChoiceVU extends ViewModelBuilderWidget<MultiChoiceViewModel> {
   MultiChoiceVU( this.questionnaire, this.callBack, this.controller,  {Key? key}) : super(key: key);
  final GetQuestionnaire questionnaire;
  final Function(Answers answer) callBack;
  late StreamController<String> controller;

  @override
  Widget builder(BuildContext context, MultiChoiceViewModel viewModel, Widget? child) {
    return
      ListView.builder(
          itemCount: questionnaire.option!.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context,index){
              return CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: Text(questionnaire.option![index].option!),
                  value: questionnaire.option![index].isCheck,
                  onChanged: (v){
                    viewModel.onClickCheckBox(questionnaire, index, v);
                  });
            }
          );
  }
  
  @override
  MultiChoiceViewModel viewModelBuilder(BuildContext context) {
    return MultiChoiceViewModel(callBack, controller);
  }

}
