import 'package:desafiomobile/Models/TaskModel.dart';
import 'package:desafiomobile/Database/DatabaseHelper.dart';





class TaskViewModel{

  DatabaseHelper db = new DatabaseHelper();

  Future<List<Map<String,dynamic>>>? getTasksDone(){
    Future<List<Map<String, dynamic>>>? result =  db.getTasksDone();
    return result;
  }

  Future<List<Map<String,dynamic>>>? getTasksNotDone(){
    Future<List<Map<String, dynamic>>>? result =  db.getTasksNotDone();
    return result;
  }

  Future<Map<String,dynamic>?> getTask(String name){
    Future<Map<String, dynamic>?> result =  db.getTask(name);
    return result;
  }

  void createTask(String? title, String? description, bool done){
    done == true ? db.createTask(title, description, '1') : db.createTask(title, description, '0');
  }

  void deleteATask(String id){
    db.deleteATask(id);
  }
}