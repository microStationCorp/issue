import 'package:cloud_firestore/cloud_firestore.dart';

import '../../resource/ui_const/app_string.dart';
import '../../view/widgets/snackbars.dart';
import '../model/todo.model.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;

class TodoService {
  CollectionReference<Todo> _todoCollectionRef(String projectId) => firestore
      .collection('projects')
      .doc(projectId)
      .collection(FirebaseString.todo)
      .withConverter<Todo>(
        fromFirestore: (snapshot, _) => Todo.fromJson(snapshot.data()!),
        toFirestore: (todo, _) => todo.toJson(),
      );

  Future<void> addTodo(Todo todo, String projectId) async {
    try {
      await _todoCollectionRef(projectId).add(todo);
      successSnackBar("Submitted", "Todo Submitted");
    } on FirebaseException catch (e) {
      errorSnackBar("Error", "Something went wrong");
    }
  }

  Stream<QuerySnapshot<Todo>> getTodos(String projectId) {
    return _todoCollectionRef(projectId)
        .orderBy('createdAt', descending: false)
        .snapshots();
  }

  Future<void> updateTodo(
      Todo updatedTodo, String projectId, String todoId) async {
    try {
      await _todoCollectionRef(projectId)
          .doc(todoId)
          .update(updatedTodo.toJson());
      successSnackBar("Updated", "Todo Updated");
    } on FirebaseException catch (e) {
      errorSnackBar("Error", "Something went wrong");
    }
  }

  Future<void> deleteTodo(String projectId, String todoId) async {
    try {
      await _todoCollectionRef(projectId).doc(todoId).delete();
      successSnackBar("Attention !", "Todo deleted succesfully");
    } on FirebaseException catch (e) {
      errorSnackBar("Error", "Something went wrong");
    }
  }
}
