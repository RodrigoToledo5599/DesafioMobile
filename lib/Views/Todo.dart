import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:desafiomobile/Widgets/UpBar.dart';


class Todo extends StatelessWidget{
  const Todo({Key? key}) : super(key: key);


  @override
  Widget build (BuildContext build){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: UpBar(),
        body: Container(
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              Text("eijiwioiowa")
            ]
          )
        ),

      )
    );
  }

}