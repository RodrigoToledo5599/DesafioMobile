import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:desafiomobile/Widgets/UpBar.dart';
import 'package:desafiomobile/Widgets/Navigate.dart';
import 'package:desafiomobile/Widgets/Task.dart';


class Todo extends StatelessWidget{
  const Todo({Key? key}) : super(key: key);


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
                  height: MediaQuery.of(context).size.height * 0.75,
                  color: Color.fromRGBO(245, 245, 245, 1),
                  child:SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:[
                            Column(
                                children:[
                                  Task(),
                                  Task(),
                                  Task(),
                                  Task(),
                                  Task(),
                                  Task(),
                                  Task(),
                                  Task(),
                                  Task(),
                                  Task(),
                                  Task(),
                                  Task(),
                                  Task(),
                                  Task(),

                                ]
                            ),
                          ]
                      )
                  )
              ),
            )

        )
      );

  }
}