import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_riverpod/providers/task_provider.dart';

class AddingNote extends ConsumerStatefulWidget {
  // StatelessWidget {
  const AddingNote({super.key});

  @override
  ConsumerState<AddingNote> createState() => _AddingNoteState();
}

class _AddingNoteState extends ConsumerState<AddingNote> {
  final TextEditingController _controller = TextEditingController();

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
                      controller: _controller,
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
                      onPressed: () {
                        final text = _controller.text.trim();
                        if (text.isNotEmpty) {
                          ref.read(tasksProvider.notifier).addTask(text);
                          Navigator.pop(context);
                        }
                      },
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
