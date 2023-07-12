import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_list_app/pages/tasks/tasks_provider/task_provider.dart';
import 'package:task_list_app/service/network_service.dart';

import 'widgets/task_details.dart';
import 'widgets/tasks_list.dart';

class TasksPage extends ConsumerStatefulWidget {
  final String? taskId;

  const TasksPage({
    Key? key,
    this.taskId,
  }) : super(key: key);

  @override
  ConsumerState<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends ConsumerState<TasksPage> {
  Future<void> getTasks() async {
    await ref.read(networkServiceProvider).getTasks().then((value) {
      ref.read(fetchedTaskProvider.notifier).update((state) => value);
    });
  }

  @override
  void initState() {
    super.initState();
    getTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: TasksList(taskId: widget.taskId ?? ''),
        ),
        VerticalDivider(),
        Expanded(
          flex: 1,
          child: TaskDetails(taskId: widget.taskId ?? ''),
        ),
      ],
    );
  }
}
