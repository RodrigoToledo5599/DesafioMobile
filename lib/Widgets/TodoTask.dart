import 'package:desafiomobile/ViewModels/TaskViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class TodoTask extends StatefulWidget {
  final int id;
  final String Name;
  final String Description;
  final int Done;

  const TodoTask({Key? key, required this.id, required this.Name, required this.Description, required this.Done}) : super(key: key);

  @override
  _TodoTask createState() => _TodoTask();
}

class _TodoTask extends State<TodoTask>{

  bool isChecked = false;
  bool isOpen = false;
  int maxlinesAllowed = 1;
  TaskViewModel tvm = new TaskViewModel();

  void openCloseTitle(){
    setState(() {
      if(maxlinesAllowed == 1){
        maxlinesAllowed = maxlinesAllowed + 1;
      }
      else if (maxlinesAllowed == 2){
        maxlinesAllowed = maxlinesAllowed - 1;
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
        child:Container(
            width: MediaQuery.of(context).size.width * 0.85,
            color: Color.fromRGBO(245, 247, 249,1),
            child:
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  Row(
                      children:[
                        Checkbox(
                          checkColor: Colors.white,
                          value: isChecked,
                          onChanged: (bool? value) {
                            setState((){
                              isChecked = !isChecked;
                            });
                          },
                        ),
                        Flexible( // Allows text to be constrained inside available width
                          child: Text(
                            "${widget.Name}",
                            overflow: TextOverflow.ellipsis,
                            maxLines: maxlinesAllowed,
                            softWrap: false,
                          ),
                        ),
                      ]
                  ),
                  if(isOpen == true)
                    Container(
                        width: MediaQuery.of(context).size.width * 0.75,
                        child:
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:[
                              SizedBox(width:MediaQuery.of(context).size.width * 0.1),
                              Text(
                                  "${widget.Description}",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: maxlinesAllowed,
                              ),
                              SizedBox(width:MediaQuery.of(context).size.width * 0.1),
                            ]
                        )
                    )
                  else
                    Container(),
                ]
            )
        )
    );
  }
}