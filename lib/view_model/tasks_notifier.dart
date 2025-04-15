import 'package:riverpod/riverpod.dart';
import 'package:to_do_riverpod/models/task_model.dart';

class TasksNotifier extends StateNotifier<List<TaskModel>> {
  TasksNotifier() : super([]);

  int get completedTasksLength => state.where((t) => t.isCompleted).length;
  int get incompleteTasksLengith => state.length - completedTasksLength;

  void addTask(String description) {
    state = [...state, TaskModel.create(description)];
  }

  void toggleTask(String id) {
    state = [
      for (final task in state)
        if (task.id == id.toString()) task.toggle() else task,
    ];
  }

  void removeTask(String id) {
    state = state.where((task) => task.id != id).toList();
  }

  void clearCompleted() {
    state = state.where((task) => !task.isCompleted).toList();
  }
}
