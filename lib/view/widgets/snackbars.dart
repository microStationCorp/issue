import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:issue/resource/ui_const/app_ui_const.dart';

void errorSnackBar(String title, String message) {
  Get.snackbar(
    title,
    message,
    animationDuration: Duration(milliseconds: 300),
    icon: const Icon(
      AppIcons.error,
    ),
  );
}

void successSnackBar(String title, String message) {
  Get.snackbar(
    title,
    message,
    animationDuration: Duration(milliseconds: 300),
    icon: const Icon(
      AppIcons.thumbsUp,
    ),
  );
}