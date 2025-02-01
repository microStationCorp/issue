import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:issue/repository/model/issue.model.dart';
import 'package:issue/repository/services/todo_service.dart';

import '../../resource/ui_const/app_string.dart';
import '../../view/widgets/snackbars.dart';

class IssueService {
  CollectionReference<Issue> issueCollectionRef(String projectId) => firestore
      .collection('projects')
      .doc(projectId)
      .collection(FirebaseString.issue)
      .withConverter<Issue>(
        fromFirestore: (snapshot, _) => Issue.fromJson(snapshot.data()!),
        toFirestore: (issue, _) => issue.toJson(),
      );

  Future<void> addIssue(Issue issue, String projectId) async {
    try {
      await issueCollectionRef(projectId).add(issue);
      successSnackBar("Submitted", "Issue Submitted");
    } on FirebaseException catch (e) {
      errorSnackBar("Error", "Something went wrong");
    }
  }

  Stream<QuerySnapshot<Issue>> getIssues(String projectId) {
    return issueCollectionRef(projectId).snapshots();
  }

  Future<void> updateIssue(
      Issue updatedIssue, String projectId, String issueId) async {
    try {
      await issueCollectionRef(projectId)
          .doc(issueId)
          .update(updatedIssue.toJson());
      successSnackBar("Updated", "Issue Updated");
    } on FirebaseException catch (e) {
      errorSnackBar("Error", "Something went wrong");
    }
  }
}
