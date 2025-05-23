import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_riverpod/providers/task_provider.dart';
import 'package:to_do_riverpod/widgets/adding_note.dart';
import 'package:to_do_riverpod/widgets/task_listile.dart';

class TasksScreen extends ConsumerWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(tasksProvider);
    final completedTasksLength =
        ref.read(tasksProvider.notifier).completedTasksLength;
    final incompleteTasksLengith =
        ref.read(tasksProvider.notifier).incompleteTasksLengith;

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leading: SizedBox(),
        backgroundColor: Colors.grey[300],
        title: Text(
          'Tasks',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Text(
              '$incompleteTasksLengith incomplete , $completedTasksLength completed ',
              style: TextStyle(fontSize: 18),
            ),

            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  final task = tasks[index];
                  return TaskLisTile(
                    task: task,
                    onToggle:
                        () => ref
                            .read(tasksProvider.notifier)
                            .toggleTask(task.id),
                  );
                  //return TaskWidget(index: index, task: tasks[index]);
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Builder(
        builder: (context) {
          return AddNoteButton();
        },
      ),
    );
  }
}
