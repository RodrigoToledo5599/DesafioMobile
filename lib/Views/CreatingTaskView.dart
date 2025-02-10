import 'package:desafiomobile/Models/TaskModel.dart';
import 'package:desafiomobile/Widgets/WelcomeJohn.dart';
import 'package:flutter/material.dart';
import 'package:desafiomobile/ViewModels/TaskViewModel.dart';
import 'package:desafiomobile/Widgets/UpBar.dart';
import 'package:desafiomobile/Widgets/TodoTask.dart';
import 'package:desafiomobile/Widgets/CreateTask.dart';

class CreatingTaskView extends StatelessWidget {
  CreatingTaskView({Key? key}) : super(key: key);

  final TaskViewModel tvm = TaskViewModel();
  TaskModel taskModel = new TaskModel();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: UpBar(),
        bottomNavigationBar: CreateTask(),
        body: Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.8,
            color: Colors.white,
            child: FutureBuilder<List<TaskModel>>(
              future: tvm.getTasksDone(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(child: Text("Error loading tasks"));
                }
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text("No tasks available"));
                }
                List<TaskModel> tasks = snapshot.data!;

                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Greeting Section
                      Container(
                        padding: EdgeInsets.all(16),
                        child:WelcomeJohn(numberOfTasks: tasks.length)
                      ),
                      Column(
                        children: tasks.map((task) {
                          return TodoTask(
                              taskModel: this.taskModel);
                        }).toList(),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
