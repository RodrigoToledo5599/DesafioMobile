import 'package:desafiomobile/ViewModels/TaskViewModel.dart';
import 'package:desafiomobile/Widgets/MinimumWidgets/CustomCheckBox.dart';
import 'package:desafiomobile/Models/TaskModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class TodoTask extends StatefulWidget {
  TaskModel taskModel = new TaskModel();
  TodoTask({
    Key? key,
    required this.taskModel,
  }) : super(key: key);

  @override
  _TodoTask createState() => _TodoTask();
}

class _TodoTask extends State<TodoTask>{
  bool isChecked = false;
  bool isOpen = false;
  int maxlinesAllowed = 1;
  TaskViewModel tvm = new TaskViewModel();

  void updateCheckBoxState(bool value){
    setState(() {
      isChecked = value;
    });
  }

  void openCloseTitle(){
    setState(() {
      print(widget.taskModel.Name);
      if(maxlinesAllowed == 1){
        maxlinesAllowed = maxlinesAllowed + 1;
      }
      else if (maxlinesAllowed == 5){
        maxlinesAllowed = maxlinesAllowed - 4;
      }
    });
  }

  void openAndCloseText(){
    setState((){
      isOpen = !isOpen;
    });
  }

  Widget build(BuildContext context){
    return GestureDetector(
        onTap:(){
          openAndCloseText();
          openCloseTitle();
        },
        child:Column(
          children:[
            SizedBox(height: MediaQuery.of(context).size.height * 0.014),
            Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(245, 247, 249,1),
                  borderRadius: BorderRadius.circular(8), // Rounded corners
                ),

                width: MediaQuery.of(context).size.width * 0.85,
                child:
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      Row(
                          children:[
                            CustomCheckBox(controlVariable: isChecked, onChanged: updateCheckBoxState),
                            Flexible(
                              child: Text(
                                "${widget.taskModel.Name}",
                                overflow: TextOverflow.ellipsis,
                                maxLines: maxlinesAllowed,
                                softWrap: false,
                                style: TextStyle(
                                    fontSize: 16
                                ),

                              ),
                            ),
                          ]
                      ),
                      if(isOpen == true)
                        Container(
                            width: MediaQuery.of(context).size.width * 1,
                            child:
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children:[
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.6,
                                    child:Row(
                                      children: [
                                        Flexible(
                                            child:
                                            Text(
                                              "${widget.taskModel.Description}",
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: maxlinesAllowed,
                                              style: TextStyle(
                                                color: Color.fromRGBO(141, 156, 184, 1),
                                                  fontSize: 14
                                              ),
                                            ),
                                        ),

                                      ],
                                    ),
                                  ),
                                  SizedBox(height: MediaQuery.of(context).size.width * 0.04)
                                ]
                            )
                        )
                      else
                        Container(),
                    ]
                )
            )
          ]
        )
    );
  }
}