import 'package:flutter/material.dart';
import 'package:desafiomobile/ViewModels/TaskViewModel.dart';
import 'package:desafiomobile/Widgets/UpBar.dart';
import 'package:desafiomobile/Widgets/Navigate.dart';
import 'package:desafiomobile/Widgets/TodoTask.dart';

class Todo extends StatelessWidget {
  Todo({Key? key}) : super(key: key);
  final TaskViewModel tvm = TaskViewModel(); // Instantiate ViewModel

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: UpBar(),
        bottomNavigationBar: Navigate(),
        body: Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.8,
            color: Colors.white,
            child: FutureBuilder<List<Map<String, dynamic>>>(
              future: tvm.getTasksDone(), // Fetch tasks asynchronously
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator()); // Show loading spinner
                }
                if (snapshot.hasError) {
                  return Center(child: Text("Error loading tasks"));
                }
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text("No tasks available"));
                }

                // Extract task list
                List<Map<String, dynamic>> tasks = snapshot.data!;

                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Greeting Section
                      Container(
                        padding: EdgeInsets.all(16),
                        child: Row(
                          children: [
                            SizedBox(width: MediaQuery.sizeOf(context).width * 0.08),
                            Text("Welcome,"),
                            Text("John", style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),

                      // Render TodoTask for each task in the list
                      Column(
                        children: tasks.map((task) {
                          return TodoTask(
                            id: task["id"] ?? "N/A",
                            Name: task["Name"] ?? "Untitled Task",
                            Description: task["Description"] ?? "No description",
                            Done: task["Done"]
                          );
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
