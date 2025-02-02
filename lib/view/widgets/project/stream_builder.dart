import 'package:issue/repository/model/todo.model.dart';

import '../../../repository/model/issue.model.dart';
import '../../../repository/services/issue_service.dart';
import 'package:flutter/material.dart';

import '../../../repository/services/todo_service.dart';
import '../generic/stream_builder.dart';

class StreamIssueBuilder extends StatelessWidget {
  final IssueService _issueService = IssueService();
  final String projectId;

  StreamIssueBuilder({super.key, required this.projectId});

  @override
  Widget build(BuildContext context) {
    return StreamListBuilder<Issue>(
      projectId: projectId,
      getStream: () => _issueService.getIssues(projectId),
      updateItem: _issueService.updateIssue,
      getStatus: (issue) => issue.isSolved,
      deleteItem: _issueService.deleteIssue,
      copyWithStatus: (issue, value) => issue.copyWith(isSolved: value),
    );
  }
}

class StreamTodoBuilder extends StatelessWidget {
  final String projectId;
  final TodoService _todoService = TodoService();

  StreamTodoBuilder({super.key, required this.projectId});

  @override
  Widget build(BuildContext context) {
    return StreamListBuilder<Todo>(
      projectId: projectId,
      getStream: () => _todoService.getTodos(projectId),
      updateItem: _todoService.updateTodo,
      getStatus: (todo) => todo.isDone,
      deleteItem: _todoService.deleteTodo,
      copyWithStatus: (todo, value) => todo.copyWith(isDone: value),
    );
  }
}
