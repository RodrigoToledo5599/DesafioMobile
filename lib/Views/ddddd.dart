import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:desafiomobile/ViewModels/TaskViewModel.dart';
import 'package:desafiomobile/Widgets/UpBar.dart';
import 'package:desafiomobile/Widgets/Navigate.dart';
import 'package:desafiomobile/Widgets/TodoTask.dart';


class Todo extends StatelessWidget{
  Todo({Key? key}) : super(key: key);
  TaskViewModel tvm = new TaskViewModel();

  @override
  Widget build (BuildContext context){
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: UpBar(),
            bottomNavigationBar: Navigate(),
            body:
            Center(
              child:
              Container(
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.height * 0.8,
                  color: Color.fromRGBO(255, 255, 255, 1),
                  child: SingleChildScrollView(
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
                                              children:[
                                                SizedBox(width: MediaQuery.sizeOf(context).width * 0.08),
                                                Text("Welcome,"),
                                                Text("John")
                                              ]
                                          )
                                        ]
                                    )
                                ),

                              ]
                          ),
                        ],
                      )
                  )
              ),
            )
        )
    );
  }
}