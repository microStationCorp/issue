import 'package:flutter/material.dart';
import 'package:issue/view/widgets/generic/dialog.dart';

import '../../../repository/controller/project.controller.dart';
import 'package:get/get.dart';

class ShadProjectDialog extends StatelessWidget {
  ShadProjectDialog({super.key});

  final ProjectController _projectController = Get.find();

  @override
  Widget build(BuildContext context) {
    return ShadGenericDialog(
      title: "Add Project",
      onSubmit: (title) {
        _projectController.title.value = title;
        _projectController.addProject();
      },
    );
  }
}
