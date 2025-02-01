import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../resource/ui_const/app_ui_const.dart';
import 'dialog.dart';

class AddProjectButton extends StatelessWidget {
  const AddProjectButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        EasyDebounce.debounce(
          "addProject",
          Duration(milliseconds: 400),
          () {
            showShadDialog(
              context: context,
              builder: (context) => Padding(
                padding: const EdgeInsets.all(10.0),
                child: ShadProjectDialog(),
              ),
            );
          },
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 10,
        children: [
          Text(
            "Add Project",
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
