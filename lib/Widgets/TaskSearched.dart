import 'package:desafiomobile/Models/TaskModel.dart';
import 'package:desafiomobile/Widgets/TodoTask.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/cupertino.dart';

class TaskSearched extends StatefulWidget{
  TaskModel taskModel;
  TaskSearched({
    Key? key,
    required this.taskModel,
  }) : super(key: key);
  _TaskSearched createState() => _TaskSearched();
}

class _TaskSearched extends State<TaskSearched>{
  bool isChecked = false;
  bool isOpen = false;

  void updateCheckBoxState(bool value){
    setState(() {
      isChecked = value;
    });
  }

  void openAndCloseText(){
    setState((){
      isOpen = !isOpen;
    });
  }

  @override
  void initState() {
    super.initState();
    print(widget.taskModel);
    // print("zzzzzzzzzz");
  }


  @override
  Widget build (BuildContext context){
    return
      Container(
        width: MediaQuery.of(context).size.width * 0.7,
        height:MediaQuery.of(context).size.height * 0.4,
      child:
      Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[
            if(widget.taskModel.id == null)
              Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                      SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                      SvgPicture.asset(
                        'lib/assets/imgs/cadernetasIcon.svg',
                        fit: BoxFit.contain,
                      ),
                      Text("No result Found",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Urbanist',
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(141, 156, 184, 1),
                          )
                      ),
                    ]
                  )
              )
            else
              TodoTask(taskModel: widget.taskModel),
          ]
      )
    );
  }
}