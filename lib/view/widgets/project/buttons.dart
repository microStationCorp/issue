import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../resource/ui_const/app_ui_const.dart';
import 'dialog.dart';

class AddTodoButton extends StatelessWidget {
  final String projectId;

  const AddTodoButton({super.key, required this.projectId});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        EasyDebounce.debounce(
          "addIssue",
          Duration(milliseconds: 400),
          () {
            showShadDialog(
              context: context,
              builder: (context) => Padding(
                padding: const EdgeInsets.all(10.0),
                child: ShadTodoDialog(
                  projectId: projectId,
                ),
              ),
            );
          },
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 5,
        children: [
          Text(
            "Add Todo",
            style: TextStyle(fontSize: UISize.primary, color: Colors.black),
          ),
          Icon(
            AppIcons.plus,
            size: UISize.primary,
            color: Colors.black,
          )
        ],
      ),
    );
  }
}

class AddIssueButton extends StatelessWidget {
  final String projectId;

  const AddIssueButton({super.key, required this.projectId});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        EasyDebounce.debounce(
          "addIssue",
          Duration(milliseconds: 400),
          () {
            showShadDialog(
              context: context,
              builder: (context) => Padding(
                padding: const EdgeInsets.all(10.0),
                child: ShadIssueDialog(
                  projectId: projectId,
                ),
              ),
            );
          },
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 5,
        children: [
          Text(
            "Add Issue",
            style: TextStyle(fontSize: UISize.primary, color: Colors.black),
          ),
          Icon(
            AppIcons.plus,
            size: UISize.primary,
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
