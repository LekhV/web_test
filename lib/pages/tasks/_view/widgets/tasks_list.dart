import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:task_list_app/common/app_style.dart';
import 'package:task_list_app/model/task.dart';
import 'package:task_list_app/pages/tasks/tasks_provider/task_provider.dart';
import 'package:task_list_app/scopes/app_router.dart';
import 'package:task_list_app/ui_kit/custom_title.dart';
import 'package:task_list_app/utils/date_utils.dart';
import 'package:task_list_app/utils/localizations_extension.dart';

import 'task_title_text.dart';

class TasksList extends ConsumerWidget {
  final String taskId;

  const TasksList({
    required this.taskId,
    Key? key,
  }) : super(key: key);

  void onTapTask({
    required BuildContext context,
    required Task task,
  }) {
    context.goNamed(
      AppRouteKeys.tasksPageUrl,
      pathParameters: {'id': task.id ?? ''},
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(fetchedTaskProvider);

    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CustomTitle(title: context.localizations!.teams),
            SizedBox(height: 36),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    onTapTask(
                      context: context,
                      task: tasks[index],
                    );
                  },
                  child: _itemTask(tasks[index]),
                ),
                itemCount: tasks.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _itemTask(Task task) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppStyle.lightTextColor,
        borderRadius: const BorderRadius.all(Radius.circular(4)),
      ),
      child: Row(
        children: [
          TaskTitleText(
            title: task.title ?? '',
            id: task.id ?? '',
            selectedId: taskId,
          ),
          Text(
            convertDateToString(task.dateTime),
            style: TextStyle(
              fontSize: 12,
              color: AppStyle.mediumTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
