import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_list_app/model/task.dart';

final fetchedTaskProvider = StateProvider<List<Task>>((ref) {
  return [];
});
