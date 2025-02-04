class TaskModel {
  int id;
  String Name;
  String? Description;
  bool Done;
  TaskModel({
    required this.id,
    required this.Name,
    this.Description,
    this.Done = false,
  });
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'Name': Name,
      'Description': Description,
      'Done': Done,
    };
  }
  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'],
      Name: json['Name'],
      Description: json['Description'],
      Done: json['Done'] ?? false,
    );
  }
  @override
  String toString() {
    return 'TaskModel(id: $id, title: $Name, isCompleted: $Done)';
  }
}