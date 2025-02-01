import 'package:get/get.dart';
import 'package:issue/repository/services/issue_service.dart';

import '../model/issue.model.dart';

class IssueController extends GetxController {
  final IssueService _issueService = IssueService();
  var title = "".obs;
  var isSolved = false.obs;

  void addIssue(String projectId) {
    _issueService.addIssue(
      Issue(
        title: title.value,
        createdAt: DateTime.now(),
        isSolved: isSolved.value,
      ),
      projectId,
    );
  }
}
