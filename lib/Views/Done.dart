import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:desafiomobile/Widgets/UpBar.dart';
import 'package:desafiomobile/Widgets/Navigate.dart';
import 'package:desafiomobile/ViewModels/TaskViewModel.dart';
import 'package:desafiomobile/Widgets/DoneTask.dart';


class Done extends StatelessWidget{
  Done({Key? key}) : super(key: key);
  final TaskViewModel tvm = TaskViewModel(); // Instantiate ViewModel

  @override
  Widget build (BuildContext context){
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: UpBar(),
            bottomNavigationBar: Navigate(),
            body: Center(
              child: Container(

                  width: MediaQuery.of(context).size.width * 0.85,
                  height: MediaQuery.of(context).size.height * 0.75,
                  color: Color.fromRGBO(255, 255, 255, 1),
                  child: FutureBuilder<List<Map<String,dynamic>>>(
                    future: tvm.getTasksNotDone(),
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
                                        child:Column(
                                          children:[
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children:[
                                                Text("Completed Tasks"),
                                                Text("Delete all",
                                                  style: TextStyle(
                                                    color: Colors.red,
                                                    fontSize:16.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              children: tasks.map((task) {
                                                return DoneTask(
                                                    id: task["id"] ?? "N/A",
                                                    Name: task["Name"] ?? "Untitled Task",
                                                    Description: task["Description"] ?? "No description",
                                                    Done: task["Done"]
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