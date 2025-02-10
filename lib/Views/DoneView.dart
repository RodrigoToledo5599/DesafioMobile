import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:desafiomobile/Widgets/UpBar.dart';
import 'package:desafiomobile/Widgets/Navigate.dart';
import 'package:desafiomobile/ViewModels/TaskViewModel.dart';
import 'package:desafiomobile/Widgets/DoneTask.dart';



class DoneView extends StatefulWidget {
  DoneView({Key? key}) : super(key: key);
  _DoneViewState createState() => _DoneViewState();
}

class _DoneViewState extends State<DoneView>{

  TaskViewModel tvm = new TaskViewModel();
  List<Map<String, dynamic>>? tasks = [];
  Map<String, bool> checkedTasks = {};

  @override
  void initState() {
    super.initState();
    loadTasks();
  }

  Future<void> loadTasks() async {
    List<Map<String, dynamic>>? fetchedTasks = await tvm.getTasksDone();
    setState(() {
      tasks = fetchedTasks;
      if(tasks!.isEmpty){
        return;
      }
      List<String> ids = <String>[];
      List<bool> checkedIds = <bool>[];
      for(int i=0; i < tasks!.length; i++){
        ids.add(tasks![i]['id'].toString());
        checkedIds.add(false);
      }
      this.checkedTasks = Map<String, bool>.fromIterables(ids, checkedIds);
    });
  }

  updateTaskStatus(String taskId) {
    checkedTasks[taskId] == true ?  checkedTasks[taskId] = false : checkedTasks[taskId] = true ;
  }

  List<String> getcheckedTaskIds() {
    return checkedTasks.entries
        .where((entry) => true)
        .map((entry) => entry.key)
        .toList();
  }


  void deleteAllSelected(BuildContext context){
    List<String> checkedIds = this.getcheckedTaskIds();
    this.checkedTasks.forEach((key, value) {
      if(value == true){
        tvm.deleteATask(key);
      }
    });
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DoneView(),
        )
    );

  }

  @override
  Widget build (BuildContext context){
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: UpBar(),
            bottomNavigationBar: Navigate(),
            body: Center(
              child: Container(
                  height: MediaQuery.of(context).size.height * 1,
                  width: MediaQuery.of(context).size.width * 1,
                  color: Color.fromRGBO(255, 255, 255, 1),
                  child: FutureBuilder<List<Map<String,dynamic>>?>(
                      future: this.tvm.getTasksDone(),
                      // future: this.tasks,
                      builder: (context, snapshot){
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator()); // Show loading spinner
                        }
                        if (snapshot.hasError) {
                          return Center(child: Text("Error loading tasks"));
                        }
                        if (!snapshot.hasData || snapshot.data!.isEmpty) {
                          return Center(child: Text("No tasks available"));
                        }
                        List<Map<String, dynamic>> tasks = snapshot.data!;

                        return SingleChildScrollView(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children:[
                                  Column(
                                      children:[
                                        Container(
                                          width: MediaQuery.of(context).size.width * 0.85,
                                          child:Column(
                                            children:[
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children:[
                                                  Text("Completed Tasks",
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontFamily: 'Urbanist',
                                                      fontWeight: FontWeight.w700,
                                                      fontSize: 20, // Font size
                                                    ),
                                                  ),
                                                  ElevatedButton(
                                                    onPressed: (){
                                                      this.deleteAllSelected(context);
                                                    },
                                                    style:ElevatedButton.styleFrom(
                                                      foregroundColor: Color.fromRGBO(198, 207, 220, 1),
                                                      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
                                                      padding: EdgeInsets.all(15),
                                                      side: BorderSide.none,
                                                      elevation: 0,
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(9.0),
                                                      ),
                                                    ),
                                                    child: Text("Delete all",
                                                      style: TextStyle(
                                                        fontFamily: 'Urbanist',
                                                        color: Colors.red,
                                                        fontSize:18.0,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Column(
                                                children: tasks.map((task) {
                                                  return DoneTask(
                                                      id: task["id"] ?? "N/A",
                                                      Name: task["Name"] ?? "Untitled Task",
                                                      Description: task["Description"] ?? "No description",
                                                      Done: task["Done"],
                                                      metodo: (taskId) => updateTaskStatus(task['id'].toString()),
                                                  );
                                                }).toList(),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ]
                                  ),
                                ]
                            )
                        );
                      }
                  )
              ),
            )
        )
    );
  }
}