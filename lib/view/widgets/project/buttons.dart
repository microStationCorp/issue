import 'package:flutter/material.dart';
import 'package:issue/view/widgets/generic/button.dart';
import 'dialog.dart';

class AddTodoButton extends StatelessWidget {
  final String projectId;

  const AddTodoButton({super.key, required this.projectId});

  @override
  Widget build(BuildContext context) {
    return AddItemButton(
      buttonText: "Add Todo",
      debounceKey: "addTodo",
      dialog: ShadTodoDialog(projectId: projectId),
    );
  }
}

class AddIssueButton extends StatelessWidget {
  final String projectId;

  const AddIssueButton({super.key, required this.projectId});

  @override
  Widget build(BuildContext context) {
    return AddItemButton(
      buttonText: "Add Issue",
      debounceKey: "addIssue",
      dialog: ShadIssueDialog(projectId: projectId),
    );
  }
}
