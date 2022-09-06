import 'package:flutter/material.dart';
import 'package:questionnaire/ui/questionnaire_vm.dart';
import 'package:questionnaire/ui/questionnaire_widgets/multi_line/multi_line_vu.dart';
import 'package:questionnaire/ui/questionnaire_widgets/single_choice/single_choice_vu.dart';
import 'package:questionnaire/ui/questionnaire_widgets/single_line/single_line_vu.dart';
import 'package:stacked/stacked.dart';

import '../models/get_questionnaire_model.dart';

class QuestionnaireVU extends ViewModelBuilderWidget<QuestionnaireViewModel> {
  const QuestionnaireVU({Key? key}) : super(key: key);

  @override
  Widget builder(
      BuildContext context, QuestionnaireViewModel viewModel, Widget? child) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
              itemCount: viewModel.questions.length,
              itemBuilder: (_, index) {
                // if(viewModel.questions[index].answerType == 'single_line') {
                //   return SingleLineVU(viewModel.questions[index], viewModel.onAddToList, viewModel.notificationController);
                // } else if(viewModel.questions[index].answerType == 'multi_line') {
                //   return MultiLineVU(viewModel.questions[index], viewModel.onAddToList, viewModel.notificationController);
                // }
                return questionBox(context, viewModel, viewModel.questions[index], index);
              }),
        ),
        ElevatedButton(
          onPressed: () {
            viewModel.focus.requestFocus();
            viewModel.answers.clear();
            viewModel.notificationController.sink.add('GetData');
          },
          focusNode: viewModel.focus,
          child: const Text('Get Focus'),
        ),
      ],
    );
  }

  Widget questionBox(
      BuildContext context,
      QuestionnaireViewModel viewModel,
      GetQuestionnaire questionnaire,
      int index,) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        width: MediaQuery.of(context).size.width / 0.4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
              color:const Color.fromARGB(255, 216, 216, 216),
              width: 1.5),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12.0,
          ),
          child: ExpansionTile(

            tilePadding: EdgeInsets.zero,
            childrenPadding: EdgeInsets.zero,
            iconColor: Colors.black,
            textColor: Colors.black,
            initiallyExpanded: index == 0 ? true : false,
            title: Row(
              children: [
                Expanded(
                  child: Text(
                    questionnaire.question!,
                    maxLines: 4,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
              ],
            ),
            children: [
              const Divider(
                color: Color.fromARGB(255, 194, 194, 194),
              ),
              questionnaire.answerType == 'single_line'
                  ? SingleLineVU(questionnaire, viewModel.onAddToList, viewModel.notificationController)
                  : questionnaire.answerType == 'multi_line'
                  ? MultiLineVU(questionnaire, viewModel.onAddToList, viewModel.notificationController)
                  : questionnaire.answerType == 'multi_choice'
                  ? Container()//MultiChoiceQuestion( questionnaire)
                  : SingleChoiceVU(questionnaire, viewModel.onAddToList, viewModel.notificationController),
            ],
          ),
        ),
      ),
    );
  }


  @override
  QuestionnaireViewModel viewModelBuilder(BuildContext context) {
    return QuestionnaireViewModel();
  }
}


