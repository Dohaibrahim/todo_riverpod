import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_riverpod/providers/task_provider.dart';
import 'package:to_do_riverpod/widgets/adding_note.dart';
import 'package:to_do_riverpod/widgets/task_widget.dart';

class TasksView extends ConsumerWidget {
  const TasksView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(tasksProvider);
    final completed = tasks.where((t) => t.isCompleted).length;
    final incomplete = tasks.length - completed;
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
              '${incomplete} incomplete , ${completed} completed ',
              style: TextStyle(fontSize: 18),
            ),

            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return TaskWidget(index: index, task: tasks[index]);
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Builder(
        builder: (context) {
          return AddingNote();
        },
      ),
    );
  }
}
