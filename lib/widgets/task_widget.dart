import 'dart:developer';

import 'package:flutter/material.dart';

class TaskWidget extends StatefulWidget {
  const TaskWidget({super.key});

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
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
            isActive = value;
            setState(() {});
          },
        ),
        title: Text('Read 5 Pages Of Book', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
