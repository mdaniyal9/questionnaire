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
      return

        ListView.builder(
            itemCount: questionnaire.option!.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context,index){
              return ListTile(
                visualDensity: VisualDensity.compact,
                title: Text(questionnaire.option![index].option!),
                leading: Radio(
                    value: questionnaire.option![index].option!,
                    groupValue: viewModel.v,
                    onChanged: (dynamic v) {
                      viewModel.onRadioBtn(v, index, questionnaire);
                    }),
              );
            });
    }
    
      @override
      SingleChoiceViewModel viewModelBuilder(BuildContext context) {
       return SingleChoiceViewModel(callBack, controller);
      }

  }
