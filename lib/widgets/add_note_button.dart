import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_riverpod/providers/task_provider.dart';
import 'package:to_do_riverpod/widgets/add_note_dialog.dart';

class AddNoteButton extends ConsumerStatefulWidget {
  // StatelessWidget {
  const AddNoteButton({super.key});

  @override
  ConsumerState<AddNoteButton> createState() => _AddingNoteState();
}

class _AddingNoteState extends ConsumerState<AddNoteButton> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showBottomSheet(
          context: context,
          builder: (context) {
            return AddNoteDialog(controller: _controller, ref: ref);
          },
        );
      },
      tooltip: 'Add Note',
      child: Icon(Icons.add),
    );
  }
}
