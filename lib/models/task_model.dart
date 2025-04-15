class TaskModel {
  final String taskDescription;
  final bool isCompleted;

  const TaskModel({this.isCompleted = false, required this.taskDescription});

  TaskModel toggle() =>
      TaskModel(taskDescription: taskDescription, isCompleted: !isCompleted);
}
