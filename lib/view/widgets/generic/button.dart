import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../resource/ui_const/app_ui_const.dart';

class AddItemButton extends StatelessWidget {
  final String buttonText;
  final String debounceKey;
  final Widget dialog;

  const AddItemButton({
    super.key,
    required this.buttonText,
    required this.debounceKey,
    required this.dialog,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => EasyDebounce.debounce(
        debounceKey,
        const Duration(milliseconds: 400),
            () => showShadDialog(
          context: context,
          builder: (context) => Padding(
            padding: const EdgeInsets.all(10.0),
            child: dialog,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            buttonText,
            style: TextStyle(
              fontSize: UISize.primary,
              color: Colors.black,
            ),
          ),
          const SizedBox(width: 5),
          Icon(
            AppIcons.plus,
            size: UISize.primary,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}