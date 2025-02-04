import 'package:desafiomobile/Models/TaskModel.dart';
import 'package:desafiomobile/Database/DatabaseHelper.dart';





class TaskViewModel{

  DatabaseHelper db = new DatabaseHelper();

  Future<List<Map<String,dynamic>>>? getAllTasks(){
    Future<List<Map<String, dynamic>>>? result =  db.getTasks();
    return result;
  }

  Future<List<Map<String,dynamic>>>? getTask(String name){
    Future<List<Map<String, dynamic>>>? result =  db.getTask(name);
    return result;
  }


}