import 'dart:async';

import 'package:flutter/material.dart';
import 'package:questionnaire/ui/questionnaire_widgets/single_choice/single_choice_vm.dart';
import 'package:stacked/stacked.dart';

import '../../../models/get_questionnaire_model.dart';


class SingleChoiceVU extends ViewModelBuilderWidget<SingleChoiceViewModel> {
  SingleChoiceVU(this.questionnaire, this.callBack, this.controller, {Key? key}) : super(key: key);
  final GetQuestionnaire questionnaire;

  final Function(Answers answer) callBack;
  late StreamController<String> controller;
  @override
  Widget builder(BuildContext context, SingleChoiceViewModel viewModel, Widget? child) {
      return ListView.builder(
            itemCount: questionnaire.options!.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context,index){
              return RadioListTile(
                visualDensity: VisualDensity.compact,
                  value: questionnaire.options![index].option!,
                  groupValue: questionnaire.selectedOption == null ? viewModel.answer == null ? '' : viewModel.answer!.selectedOption![0] : questionnaire.selectedOption![0],
                  onChanged: (dynamic v) {
                    viewModel.onRadioBtn(v, index, questionnaire);
                  },
                  title: Text(questionnaire.options![index].option!),
              );
            });
    }
    
      @override
      SingleChoiceViewModel viewModelBuilder(BuildContext context) {
       return SingleChoiceViewModel(callBack, controller);
      }

  }
