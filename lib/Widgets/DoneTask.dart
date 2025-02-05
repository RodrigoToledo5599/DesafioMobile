import 'package:desafiomobile/ViewModels/TaskViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class DoneTask extends StatefulWidget {
  final int id;
  final String Name;
  final String Description;
  final int Done;

  const DoneTask({Key? key, required this.id, required this.Name, required this.Description, required this.Done}) : super(key: key);
  @override
  _DoneTask createState() => _DoneTask();
}

class _DoneTask extends State<DoneTask>{
  bool isChecked = false;
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


  Widget build(BuildContext context){
    return GestureDetector(
        onTap: (){
          openCloseTitle();
      },
      child : Container(
            width: MediaQuery.of(context).size.width * 0.85,
            color: Color.fromRGBO(245, 247, 249,1),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                  Container(
                    child:
                    Row(
                        children:[
                          Container(
                            width: MediaQuery.of(context).size.width * 0.75,
                            child:
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
                                  Flexible( // Allows text to be constrained inside available width
                                    child: Text(
                                      "${widget.Name}",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: maxlinesAllowed,
                                      softWrap: false,
                                    ),
                                  ),
                                ]
                            )
                          ),
                          Icon(
                            color: Colors.red,
                            Icons.restore_from_trash,
                          )
                        ]
                    ),
                  ),
                ]
            ),
      )
    );
  }
}