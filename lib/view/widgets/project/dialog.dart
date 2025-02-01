import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../repository/controller/issue.controller.dart';
import '../../../repository/controller/todo.controller.dart';
import '../../../resource/ui_const/app_ui_const.dart';

class ShadTodoDialog extends StatelessWidget {
  final String projectId;

  ShadTodoDialog({super.key, required this.projectId});

  final TodoController _todoController = Get.find();

  final TextEditingController _titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ShadDialog(
      title: Text(
        "Add Todo",
        style: TextStyle(
          fontSize: UISize.primary,
          fontWeight: FontWeight.normal,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            _todoController.addTodo(projectId);
            Navigator.of(context).pop();
          },
          child: Text(
            "Submit",
            style: TextStyle(
              fontSize: UISize.primary,
              color: Colors.black,
            ),
          ),
        )
      ],
      child: Column(
        children: [
          ShadInput(
            onChanged: (value) {
              _todoController.title.value = value;
            },
            controller: _titleController,
            enabled: true,
            placeholder: Text(
              "Todo",
              style: TextStyle(
                fontSize: UISize.primary,
              ),
            ),
            inputPadding: EdgeInsets.symmetric(
              horizontal: 2,
              vertical: 2,
            ),
            style: TextStyle(
              fontSize: UISize.primary,
              color: Colors.black,
            ),
            suffix: IconButton(
              onPressed: () {
                _titleController.clear();
                _todoController.title.value = _titleController.text;
              },
              icon: Icon(AppIcons.cross),
            ),
          ),
        ],
      ),
    );
  }
}

class ShadIssueDialog extends StatelessWidget {
  final String projectId;

  ShadIssueDialog({super.key, required this.projectId});

  final IssueController _issueController = Get.find();

  final TextEditingController _titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ShadDialog(
      title: Text(
        "Add Issue",
        style: TextStyle(
          fontSize: UISize.primary,
          fontWeight: FontWeight.normal,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            _issueController.addIssue(projectId);
            Navigator.of(context).pop();
          },
          child: Text(
            "Submit",
            style: TextStyle(
              fontSize: UISize.primary,
              color: Colors.black,
            ),
          ),
        )
      ],
      child: Column(
        children: [
          ShadInput(
            onChanged: (value) {
              _issueController.title.value = value;
            },
            controller: _titleController,
            enabled: true,
            placeholder: Text(
              "Issue",
              style: TextStyle(
                fontSize: UISize.primary,
              ),
            ),
            inputPadding: EdgeInsets.symmetric(
              horizontal: 2,
              vertical: 2,
            ),
            style: TextStyle(
              fontSize: UISize.primary,
              color: Colors.black,
            ),
            suffix: IconButton(
              onPressed: () {
                _titleController.clear();
                _issueController.title.value = _titleController.text;
              },
              icon: Icon(AppIcons.cross),
            ),
          ),
        ],
      ),
    );
  }
}
