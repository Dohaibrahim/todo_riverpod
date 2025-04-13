import 'package:riverpod/riverpod.dart';
import 'package:to_do_riverpod/models/task_model.dart';

class TasksNotifier extends StateNotifier<List<TaskModel>> {
  TasksNotifier() : super([]);

  void addTask(String description) {
    state = [...state, TaskModel(taskDescription: description)];
  }

  void toggleTask(int index) {
    state = [
      for (int i = 0; i < state.length; i++)
        if (i == index) state[i].toggle() else state[i],
    ];
  }
}
