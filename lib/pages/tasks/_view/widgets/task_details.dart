import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_list_app/common/app_style.dart';
import 'package:task_list_app/model/task.dart';
import 'package:task_list_app/pages/tasks/tasks_provider/task_provider.dart';
import 'package:task_list_app/ui_kit/custom_title.dart';
import 'package:task_list_app/utils/date_utils.dart';

class TaskDetails extends ConsumerStatefulWidget {
  final String taskId;

  const TaskDetails({
    required this.taskId,
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<TaskDetails> createState() => _TaskDetailsState();
}

class _TaskDetailsState extends ConsumerState<TaskDetails> {
  Task? task;

  void initTask() {
    if (widget.taskId.isNotEmpty) {
      setState(() {
        final tasks = ref.watch(fetchedTaskProvider);
        task = tasks.firstWhere((element) => element.id == widget.taskId);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      initTask();
    });
  }

  @override
  void didUpdateWidget(covariant TaskDetails oldWidget) {
    super.didUpdateWidget(oldWidget);
    initTask();
  }

  @override
  Widget build(BuildContext context) {
    return task != null
        ? Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTitle(title: task!.title ?? ''),
                SizedBox(height: 36),
                Text(
                  convertDateToString(task!.dateTime),
                  style: TextStyle(
                    fontSize: 12,
                    color: AppStyle.mediumTextColor,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  task!.description ?? '',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          )
        : SizedBox();
  }
}
