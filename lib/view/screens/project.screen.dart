import 'package:flutter/material.dart';

import '../../resource/ui_const/app_ui_const.dart';
import '../widgets/project/buttons.dart';
import '../widgets/project/stream_builder.dart';

class ProjectScreen extends StatefulWidget {
  final String projectId;

  const ProjectScreen({super.key, required this.projectId});

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  var _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Project',
          style: TextStyle(fontSize: UISize.appbarHeading),
        ),
        leading: IconButton(
          icon: Icon(
            AppIcons.back,
            size: UISize.appbarHeading,
          ),
          // Change the icon and color
          onPressed: () {
            Navigator.pop(context); // Navigate back
          },
        ),
      ),
      body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              (_selectedIndex == 0)
                  ? AddIssueButton(projectId: widget.projectId)
                  : AddTodoButton(projectId: widget.projectId),
              Expanded(
                child: (_selectedIndex == 0)
                    ? StreamIssueBuilder(projectId: widget.projectId)
                    : StreamTodoBuilder(projectId: widget.projectId),
              ),
            ],
          )),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(AppIcons.issue),
            label: "Issues",
          ),
          BottomNavigationBarItem(icon: Icon(AppIcons.todo), label: "Todos"),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
