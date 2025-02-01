import 'package:easy_debounce/easy_debounce.dart';
import 'package:issue/repository/model/todo.model.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../repository/model/issue.model.dart';
import '../../../repository/services/issue_service.dart';
import 'package:flutter/material.dart';

import '../../../repository/services/todo_service.dart';
import '../../../resource/ui_const/app_ui_const.dart';
import '../../../resource/util/timestamp.dart';

class StreamIssueBuilder extends StatelessWidget {
  final IssueService _issueService = IssueService();
  final String projectId;

  StreamIssueBuilder({super.key, required this.projectId});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _issueService.getIssues(projectId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else {
          if (snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text("No issues found"),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              final issue = snapshot.data!.docs[index];
              return Card(
                elevation: issue.data().isSolved ? 0 : 1,
                child: ListTile(
                  title: Text(
                    issue["title"],
                    style: TextStyle(
                      fontSize: UISize.primary,
                      decoration: issue.data().isSolved
                          ? TextDecoration.lineThrough
                          : null,
                    ),
                  ),
                  subtitle: Text(formatTimestamp(issue.data().createdAt)),
                  onTap: () {},
                  leading: ShadCheckbox(
                    value: issue.data().isSolved,
                    onChanged: (newValue) {
                      EasyDebounce.debounce(
                        "issue$index",
                        Duration(
                          milliseconds: 400,
                        ),
                        () {
                          _issueService.updateIssue(
                            Issue(
                              title: issue.data().title,
                              createdAt: issue.data().createdAt,
                              isSolved: newValue,
                            ),
                            projectId,
                            issue.id,
                          );
                        },
                      );
                    },
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

class StreamTodoBuilder extends StatelessWidget {
  final String projectId;
  final TodoService _todoService = TodoService();

  StreamTodoBuilder({super.key, required this.projectId});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _todoService.getTodos(projectId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else {
          if (snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text("No todos found"),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              final todo = snapshot.data!.docs[index];
              return Card(
                elevation: todo.data().isDone ? 0 : 1,
                child: ListTile(
                  title: Text(
                    todo["title"],
                    style: TextStyle(
                      fontSize: UISize.primary,
                      decoration: todo.data().isDone
                          ? TextDecoration.lineThrough
                          : null,
                    ),
                  ),
                  subtitle: Text(formatTimestamp(todo.data().createdAt)),
                  onTap: () {},
                  leading: ShadCheckbox(
                    value: todo.data().isDone,
                    onChanged: (newValue) {
                      EasyDebounce.debounce(
                        "todo$index",
                        Duration(
                          milliseconds: 400,
                        ),
                        () {
                          _todoService.updateTodo(
                            Todo(
                              title: todo.data().title,
                              createdAt: todo.data().createdAt,
                              isDone: newValue,
                            ),
                            projectId,
                            todo.id,
                          );
                        },
                      );
                    },
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
