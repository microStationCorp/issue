import 'package:flutter/material.dart';
import 'package:issue/resource/ui_const/app_ui_const.dart';
import '../widgets/home/buttons.dart';
import '../widgets/home/stream_builder.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Home',
          style: TextStyle(fontSize: UISize.appbarHeading),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: StreamProjectBuilder(),
            ),
            AddProjectButton(),
          ],
        ),
      ),
    );
  }
}
