import 'package:flutter/material.dart';
import 'package:to_do_riverpod/widgets/task_widget.dart';

class TasksView extends StatelessWidget {
  const TasksView({super.key});

  @override
  Widget build(BuildContext context) {
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
              '${2} incomplete , ${2} completed ',
              style: TextStyle(fontSize: 18),
            ),
            TaskWidget(),
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

class AddingNote extends StatelessWidget {
  const AddingNote({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showBottomSheet(
          context: context,
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.all(22.0),
              child: SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.45,
                child: Column(
                  children: [
                    TextFormField(
                      onSaved: (newValue) {},
                      //initialValue: 'write a note',
                      decoration: InputDecoration(
                        hintText: 'Add New Note',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    MaterialButton(
                      onPressed: () {},
                      color: Colors.blue,
                      shape: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text("Add"),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      tooltip: 'Add Note',
      child: Icon(Icons.add),
    );
  }
}
