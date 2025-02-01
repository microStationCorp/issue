import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../repository/controller/issue.controller.dart';
import '../../../repository/controller/todo.controller.dart';
import '../generic/dialog.dart';

class ShadTodoDialog extends StatelessWidget {
  final String projectId;

  ShadTodoDialog({super.key, required this.projectId});

  final TodoController _todoController = Get.find();

  @override
  Widget build(BuildContext context) {
    return ShadGenericDialog(
      title: "Add Todo",
      onSubmit: (title) {
        _todoController.title.value = title;
        _todoController.addTodo(projectId);
      },
    );
  }
}

class ShadIssueDialog extends StatelessWidget {
  final String projectId;

  ShadIssueDialog({super.key, required this.projectId});

  final IssueController _issueController = Get.find();

  @override
  Widget build(BuildContext context) {
    return ShadGenericDialog(
      title: "Add Issue",
      onSubmit: (title) {
        _issueController.title.value = title;
        _issueController.addIssue(projectId);
      },
    );
  }
}
