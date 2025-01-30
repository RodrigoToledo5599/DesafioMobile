import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:desafiomobile/Models/TaskModel.dart';





class Task extends StatefulWidget {
  @override
  _Task createState() => _Task();
}

class _Task extends State<Task>{

  bool isChecked = false;
  bool isOpen = false;

  void openAndCloseText(){
    setState((){
      isOpen = !isOpen;
    });
  }

  Widget build(BuildContext context){
    return GestureDetector(
      onTap: (){
        openAndCloseText();
        print(isOpen);
      },
      child:Container(
          width: MediaQuery.of(context).size.width * 0.85,

          color: Color.fromRGBO(245, 247, 249,1),
          // color: Color.fromRGBO(245, 0, 0,1),
          child:
          Column(
              children:[
                Row(
                    children:[
                      Checkbox(
                        checkColor: Colors.white,
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = !isChecked;
                          });
                        },
                      ),
                      Text("wqqdqwdq"),
                    ]
                ),
                if(isOpen == true)
                  Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
                      "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, ")
                else
                  Text(""),
              ]
          )
      )
    );
  }
}