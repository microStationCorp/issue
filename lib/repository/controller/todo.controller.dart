import 'package:get/get.dart';
import 'package:issue/repository/services/todo_service.dart';

import '../model/todo.model.dart';

class TodoController extends GetxController {
  final TodoService _todoService = TodoService();
  var title = "".obs;
  var isDone = false.obs;

  void addTodo(String projectId) {
    _todoService.addTodo(
      Todo(
        title: title.value,
        createdAt: DateTime.now(),
        isDone: isDone.value,
      ),
      projectId,
    );
  }
}
