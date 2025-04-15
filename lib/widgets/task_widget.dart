import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_riverpod/models/task_model.dart';
import 'package:to_do_riverpod/providers/task_provider.dart';

class TaskWidget extends ConsumerWidget {
  const TaskWidget({super.key, required this.task, required this.index});
  final TaskModel task;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.054,
      child: ListTile(
        leading: Checkbox(
          value: task.isCompleted,
          activeColor: Colors.blue,
          onChanged: (_) {
            ref.read(tasksProvider.notifier).toggleTask(index);
          },
        ),
        title: Text(task.taskDescription, style: const TextStyle(fontSize: 20)),
      ),
    );
  }
}
/*
class TaskWidget extends ConsumerStatefulWidget {
  // StatefulWidget {
  const TaskWidget({super.key, required this.taskDec, required int index});
  final String taskDec;


  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TaskWidgetConsumerState();
}

class _TaskWidgetConsumerState extends ConsumerState<ConsumerStatefulWidget>{
  bool? isActive = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.054,
      child: ListTile(
        leading: Checkbox(
          value: isActive,
          activeColor: Colors.blue,
          onChanged: (value) {
            ref.read(tasksProvider.notifier).toggleTask(.index);
            //isActive = value;
            setState(() {});
          },
        ),
        title: Text(widget.taskDec, style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
*/