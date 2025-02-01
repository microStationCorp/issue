import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:flutter/material.dart';
import '../../../resource/ui_const/app_ui_const.dart';

class ShadGenericDialog extends StatelessWidget {
  final String title;
  final Function(String) onSubmit;
  final TextEditingController _titleController = TextEditingController();

  ShadGenericDialog({
    super.key,
    required this.title,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return ShadDialog(
      title: Text(
        title,
        style: TextStyle(
          fontSize: UISize.dialogHeading,
          fontWeight: FontWeight.normal,
        ),
      ),
      actions: [
        ShadButton.link(
          onPressed: () {
            onSubmit(_titleController.text);
            Navigator.of(context).pop();
          },
          child: Text(
            "Submit",
            style: TextStyle(
              fontSize: UISize.primary,
            ),
          ),
        )
      ],
      child: Column(
        children: [
          ShadInput(
            onChanged: (value) {
              // Update the title in the controller
            },
            controller: _titleController,
            enabled: true,
            placeholder: Text(
              title,
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
              },
              icon: Icon(AppIcons.cross),
            ),
          ),
        ],
      ),
    );
  }
}
