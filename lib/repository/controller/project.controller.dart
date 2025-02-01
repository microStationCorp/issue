import 'package:get/get.dart';

import '../model/project.model.dart';
import '../services/project_service.dart';

class ProjectController extends GetxController {
  final ProjectService _projectService = ProjectService();

  ProjectService get projectService => _projectService;

  RxString title = "".obs;

  void addProject() {
    _projectService.addProject(
      Project(
        title: title.value,
        createdAt: DateTime.now(),
      ),
    );
  }

}
