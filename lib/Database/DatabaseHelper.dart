import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:desafiomobile/Database/DatabaseCreation.dart';
import 'package:path/path.dart';



class DatabaseHelper{

  Future<Database> _getDatabase() async{
    return openDatabase(
      join(await getDatabasesPath(),DB_NAME),
      onCreate: (db, version) async {
        await db.execute(CREATE_DB_SCRIPT);
        for (int i = 0; i < SEED_TABLE.length; i++) {
          db.rawInsert(SEED_TABLE[i]);
        }
      },
      version: VERSION,
    );
  }

  Future<List<Map<String,dynamic>>>? getTasksDone() async {
    try {
      final Database db = await _getDatabase();
      final Future<List<Map<String, dynamic>>> maps = db.query(TASK_TABLE_NAME,where: "Done = 1");
      return maps;
    } catch (ex) {
      print(ex);
      return new List<Map<String,dynamic>>.empty();
    }
  }

  Future<List<Map<String,dynamic>>>? getTasksNotDone() async {
    try {
      final Database db = await _getDatabase();
      final Future<List<Map<String, dynamic>>> maps = db.query(TASK_TABLE_NAME,where: "Done = 0");
      return maps;
    } catch (ex) {
      print(ex);
      return new List<Map<String,dynamic>>.empty();
    }
  }

  Future<Map<String, dynamic>?> getTask(String name) async {
    name = name.trim();
    try {
      final Database db = await _getDatabase();
      if(name == ""){
        print("vai retornar null");
        return null;
      }
      final List<Map<String, dynamic>> result = await db.query(
        TASK_TABLE_NAME,
        where: "$TaskName LIKE '%$name%'",
        limit: 1,
      );
      print("RESULTADO: $result");
      return result.first;
    } catch (ex) {
      print(ex);
      return null;
    }
  }

  Future createTask(String? task_name,String? task_description, String done) async{
    if(task_name == "" && task_description == ""){
      return;
    }
    else{
      try{
        final Database db = await _getDatabase();
        await db.rawInsert('''
          INSERT INTO $TASK_TABLE_NAME($TaskName, $TaskDescription, $TaskDoneOrNot) VALUES('${task_name}','${task_description}','$done')
        ''');
      }catch(ex){
        return;
      }
    }
  }

  Future deleteATask(String id) async {
    if(id == ""){
      return;
    }
    else{
      try{
        final Database db = await _getDatabase();
        await db.rawInsert('''
          DELETE FROM $TASK_TABLE_NAME WHERE id = $id
        ''');
      }catch(ex){
        return;
      }
    }
  }


}