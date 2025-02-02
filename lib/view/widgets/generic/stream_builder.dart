import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:flutter/material.dart';

import '../../../resource/util/timestamp.dart';

class StreamListBuilder<T> extends StatelessWidget {
  final Stream<QuerySnapshot> Function() getStream;
  final Future<void> Function(T item, String projectId, String docId)
      updateItem;
  final Future<void> Function(String projectId, String issueId) deleteItem;
  final bool Function(T) getStatus;
  final T Function(T, bool) copyWithStatus;
  final String projectId;

  const StreamListBuilder({
    super.key,
    required this.getStream,
    required this.updateItem,
    required this.getStatus,
    required this.projectId,
    required this.copyWithStatus,
    required this.deleteItem,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: getStream(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(child: Text("No items found"));
        }
        return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            final doc = snapshot.data!.docs[index];
            final item = doc.data() as T;
            return Card(
              elevation: getStatus(item) ? 0 : 1,
              child: ListTile(
                title: Text(
                  (item as dynamic).title,
                  style: TextStyle(
                    decoration:
                        getStatus(item) ? TextDecoration.lineThrough : null,
                  ),
                ),
                subtitle: Text(formatTimestamp((item as dynamic).createdAt)),
                leading: ShadCheckbox(
                  value: getStatus(item),
                  onChanged: (value) => EasyDebounce.debounce(
                    'debounce$index',
                    const Duration(milliseconds: 400),
                    () => updateItem(
                      copyWithStatus(item, value),
                      projectId,
                      doc.id,
                    ),
                  ),
                ),
                onLongPress: () {
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
                            deleteItem(projectId, doc.id);
                            Navigator.of(context).pop(true);
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
