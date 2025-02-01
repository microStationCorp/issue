import 'package:flutter/material.dart';

import '../../../repository/controller/project.controller.dart';
import '../../../resource/ui_const/app_ui_const.dart';
import 'package:get/get.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ShadProjectDialog extends StatelessWidget {
  ShadProjectDialog({super.key});

  final ProjectController _projectController = Get.find();
  final TextEditingController _titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ShadDialog(
      title: Text(
        "Add Project",
        style: TextStyle(
          fontSize: UISize.primary,
          fontWeight: FontWeight.normal,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            _projectController.addProject();
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
              _projectController.title.value = value;
            },
            controller: _titleController,
            enabled: true,
            placeholder: Text(
              "Project Name",
              style: TextStyle(
                fontSize: UISize.primary,
              ),
            ),
            style: TextStyle(
              fontSize: UISize.primary,
              color: Colors.black,
            ),
            suffix: IconButton(
              onPressed: () {
                _titleController.clear();
                _projectController.title.value = _titleController.text;
              },
              icon: Icon(AppIcons.cross),
            ),
          ),
        ],
      ),
    );
  }
}
