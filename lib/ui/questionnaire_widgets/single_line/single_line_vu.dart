import 'dart:async';

import 'package:flutter/material.dart';
import 'package:questionnaire/models/get_questionnaire_model.dart';
import 'package:questionnaire/ui/questionnaire_widgets/single_line/single_line_vm.dart';
import 'package:stacked/stacked.dart';

class SingleLineVU extends ViewModelBuilderWidget<SingleLineViewModel> {
  SingleLineVU(this.questionnaire, this.callBack, this.controller, {Key? key}) : super(key: key);
  final GetQuestionnaire questionnaire;
  final Function(Answers answer) callBack;
  late StreamController<String> controller;


  @override
  Widget builder(BuildContext context, SingleLineViewModel viewModel, Widget? child) {
    return Form(
      key: viewModel.formKey,
      child: TextFormField(
        onSaved: (v){
          debugPrint('ON Saved called');
        },
        initialValue: viewModel.questionnaire.answer ?? '',
        validator: viewModel.onValidate,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        maxLines: 1,
        focusNode: viewModel.focus,
        decoration: const InputDecoration(
            hintText: 'write_your_answer_here',
            hintStyle: TextStyle(
                color: Color.fromARGB(255, 194, 194, 194),),),
      ),
    );
  }

  @override
  SingleLineViewModel viewModelBuilder(BuildContext context) {
    return SingleLineViewModel(questionnaire, callBack, controller);
  }
}