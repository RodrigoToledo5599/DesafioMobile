import 'package:desafiomobile/Models/TaskModel.dart';
import 'package:desafiomobile/Database/DatabaseHelper.dart';



class TaskViewModel{

  DatabaseHelper db = new DatabaseHelper();

  Future<List<TaskModel>>? getTasksDone() async {
    List<Map<String, dynamic>>? result = await db.getTasksDone();
    List<TaskModel>? tasks = [];

    if(result == null || result == []){
      return [];
    }
    for (var item in result!) {
      TaskModel taskmodel = new TaskModel();
      taskmodel.getFromMapString(item);
      tasks!.add(taskmodel);
      print(item);
    }
    return Future.value(tasks);
  }


  Future<List<TaskModel>?> getTasksNotDone() async {
    List<Map<String, dynamic>>? result = await db.getTasksNotDone();
    List<TaskModel>? tasks = [];

    if(result == null || result == []){
      return null;
    }
    for (var item in result!) {
      TaskModel taskmodel = new TaskModel();
      taskmodel.getFromMapString(item);
      tasks!.add(taskmodel);
    }
    return Future.value(tasks);
  }

  Future<TaskModel?> getTask(String name) async {
    Map<String, dynamic>? query = await db.getTask(name);
    TaskModel result= new TaskModel();
    result.getFromMapString(query!);
    return Future.value(result);
  }

  void createTask(String? title, String? description, bool done){
    done == true ? db.createTask(title, description, '1') : db.createTask(title, description, '0');
  }

  void deleteATask(String id){
    db.deleteATask(id);
  }
}