import 'package:get/get.dart';
import 'package:issue/repository/controller/issue.controller.dart';
import 'package:issue/repository/controller/project.controller.dart';
import 'package:issue/repository/controller/todo.controller.dart';

class DependencyInjection {
  void init() {
    Get.lazyPut<ProjectController>(() => ProjectController(), fenix: true);
    Get.lazyPut<IssueController>(() => IssueController(), fenix: true);
    Get.lazyPut<TodoController>(() => TodoController(), fenix: true);
  }
}
