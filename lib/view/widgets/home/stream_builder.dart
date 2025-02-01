import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../repository/services/project_service.dart';
import '../../../resource/ui_const/app_ui_const.dart';
import '../../../resource/util/timestamp.dart';
import 'package:get/get.dart';

import '../../screens/project.screen.dart';

class StreamProjectBuilder extends StatelessWidget {
  StreamProjectBuilder({super.key});

  final ProjectService _projectService = ProjectService();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _projectService.getProjects(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          if (snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text("No projects found"),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              final project = snapshot.data!.docs[index];
              return Card(
                child: ListTile(
                  title: Text(
                    project.data().title,
                    style: TextStyle(fontSize: UISize.primary),
                  ),
                  subtitle: Text(formatTimestamp(project.data().createdAt)),
                  onTap: () {
                    Get.to(() => ProjectScreen(projectId: project.id));
                  },
                  trailing: IconButton(
                    onPressed: () {
                      showShadDialog(
                        context: context,
                        builder: (context) => ShadDialog.alert(
                          title: const Text('Are you sure?'),
                          description: const Padding(
                            padding: EdgeInsets.only(bottom: 8),
                            child: Text(
                              'This action cannot be undone. This will permanently delete your project and remove your data from our servers.',
                            ),
                          ),
                          actions: [
                            ShadButton.outline(
                              child: const Text('Cancel'),
                              onPressed: () => Navigator.of(context).pop(false),
                            ),
                            ShadButton(
                              child: const Text('Continue'),
                              onPressed: () {
                                _projectService.deleteProject(project.id);
                                Navigator.of(context).pop(true);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                    icon: Icon(
                      AppIcons.delete,
                      size: UISize.primary,
                    ),
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}
