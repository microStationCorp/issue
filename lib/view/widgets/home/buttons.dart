import 'package:flutter/material.dart';
import 'package:issue/view/widgets/generic/button.dart';
import 'dialog.dart';

class AddProjectButton extends StatelessWidget {
  const AddProjectButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AddItemButton(
      buttonText: "Add Project",
      debounceKey: "addProject",
      dialog: ShadProjectDialog(),
    );
  }
}
