import 'package:riverpod/riverpod.dart';
import 'package:to_do_riverpod/models/task_model.dart';
import 'package:to_do_riverpod/view_model/tasks_notifier.dart';

final tasksProvider = StateNotifierProvider<TasksNotifier, List<TaskModel>>(
  (ref) => TasksNotifier(),
);
