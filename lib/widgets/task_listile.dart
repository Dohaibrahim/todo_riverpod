import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_riverpod/models/task_model.dart';
import 'package:to_do_riverpod/providers/task_provider.dart';

class TaskLisTile extends ConsumerWidget {
  const TaskLisTile({super.key, required this.onToggle, required this.task});
  final TaskModel task;
  //final int index;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.054,
      child: ListTile(
        leading: Checkbox(
          value: task.isCompleted,
          activeColor: Colors.blue,
          onChanged: (_) => onToggle(),
        ),
        title: Text(task.taskDescription, style: const TextStyle(fontSize: 20)),
      ),
    );
  }
}
