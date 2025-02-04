import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:desafiomobile/Widgets/UpBar.dart';
import 'package:desafiomobile/Widgets/Navigate.dart';
import 'package:desafiomobile/Widgets/DoneTask.dart';


class Done extends StatelessWidget{
  const Done({Key? key}) : super(key: key);

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
                  width: MediaQuery.of(context).size.width * 0.85,
                  height: MediaQuery.of(context).size.height * 0.75,
                  color: Color.fromRGBO(255, 255, 255, 1),
                  child:SingleChildScrollView(
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
                                          ],
                                      ),
                                  ),
                                  DoneTask(),
                                  DoneTask(),
                                  DoneTask(),
                                  DoneTask(),
                                  DoneTask(),
                                  DoneTask(),
                                  DoneTask(),
                                  DoneTask(),
                                  DoneTask(),
                                  DoneTask(),
                                  DoneTask(),
                                  DoneTask(),
                                  DoneTask(),
                                  DoneTask(),
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