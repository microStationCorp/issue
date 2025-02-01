import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:issue/repository/model/project.model.dart';
import 'package:issue/repository/services/todo_service.dart';
import 'package:issue/resource/ui_const/app_string.dart';
import 'package:issue/view/widgets/snackbars.dart';

import '../model/todo.model.dart';

class ProjectService {
  late final CollectionReference<Project> _projectCollectionRef;

  CollectionReference<Project> get projectCollectionRef =>
      _projectCollectionRef; // ignore: public_member_api_docs>

  ProjectService() {
    _projectCollectionRef = firestore.collection('projects').withConverter(
          fromFirestore: (snapshot, _) => Project.fromJson(snapshot.data()!),
          toFirestore: (project, _) => project.toJson(),
        );
  }

  Future<void> addProject(Project project) async {
    try {
      await _projectCollectionRef.add(project);
      successSnackBar("Submitted", "Project Submitted");
    } on FirebaseException catch (e) {
      errorSnackBar("Error", "Something went wrong");
    }
  }

  Stream<QuerySnapshot<Project>> getProjects() {
    return _projectCollectionRef
        .orderBy('createdAt', descending: true)
        .snapshots();
  }

  Future<void> deleteProject(String projectId) async {
    try {
      var todoRef =
          _projectCollectionRef.doc(projectId).collection(FirebaseString.todo);
      var todoSnapshots = await todoRef.get();

      var issueRef =
          _projectCollectionRef.doc(projectId).collection(FirebaseString.issue);
      var issueSnapshot = await issueRef.get();
      deleteAllDocuments(todoSnapshots).then((value) {
        deleteAllDocuments(issueSnapshot).then((value) {
          _projectCollectionRef.doc(projectId).delete().then((value) {
            successSnackBar("Attention !", "Project deleted succesfully");
          });
        });
      });
    } on FirebaseException catch (e) {
      errorSnackBar("Error", "Something went wrong");
    }
  }
}

Future<void> deleteAllDocuments(
    QuerySnapshot<Map<String, dynamic>> snapshot) async {
  for (var doc in snapshot.docs) {
    await doc.reference.delete();
  }
}
