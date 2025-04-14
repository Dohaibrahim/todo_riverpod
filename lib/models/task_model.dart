class TaskModel {
  final String taskDescription;
  final bool isCompleted;
  final String id;

  factory TaskModel.create(String description) {
    return TaskModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      taskDescription: description,
    );
  }

  const TaskModel({
    required this.id,
    this.isCompleted = false,
    required this.taskDescription,
  });

  TaskModel toggle() => TaskModel(
    taskDescription: taskDescription,
    isCompleted: !isCompleted,
    id: id,
  );
}
