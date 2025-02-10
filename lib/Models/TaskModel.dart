class TaskModel {
  int? id;
  String? Name;
  String? Description;
  bool? Done;

  TaskModel({
    this.id,
    this.Name,
    this.Description,
    this.Done,
  });
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'Name': Name,
      'Description': Description,
      'Done': Done,
    };
  }
  bool IsEmpty(){
    if(this.id == null){
      return true;
    }
    return false;
  }

  TaskModel getFromMapString(Map<String, dynamic> json){
    this.id =  json['id'];
    this.Name = json['Name'];
    this.Description = json['Description'];
    this.Done = json['Done'] == 1 ? true : false;
    return TaskModel(
      id: this.id,
      Name: this.Name,
      Description: this.Description,
      Done: this.Done
    );
  }

  @override
  String toString() {
    return 'TaskModel(id: $id, Name: $Name, Description: $Description, Done: $Done)';
  }
}