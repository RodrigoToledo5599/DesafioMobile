import 'package:desafiomobile/ViewModels/TaskViewModel.dart';
import 'package:desafiomobile/Views/DoneView.dart';
import 'package:desafiomobile/Widgets/MinimumWidgets/CustomCheckBoxDone.dart';
import 'package:flutter/cupertino.dart';
import 'package:desafiomobile/Models/TaskModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DoneTask extends StatefulWidget {
  TaskModel taskModel = new TaskModel();
  final Function(String) metodo;

  DoneTask({
    Key? key,
    required this.taskModel,
    required this.metodo,
  }) : super(key: key);

  @override
  _DoneTask createState() => _DoneTask();
}

class _DoneTask extends State<DoneTask>{
  bool isChecked = false;
  int maxlinesAllowed = 1;
  TaskViewModel tvm = new TaskViewModel();

  void updateCheckBoxState(bool value){
    setState(() {
      isChecked = value;
    });
  }

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
      child:
      Column(
        children:[
          SizedBox(height: MediaQuery.of(context).size.height * 0.014),
          Container(
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
                              width: MediaQuery.of(context).size.width * 0.67,
                              child:
                              Row(
                                  children:[
                                    CustomCheckBoxDone(
                                        Id: widget.taskModel.id.toString(),
                                        controlVariable: isChecked,
                                        onChanged: updateCheckBoxState,
                                        updatecheckedId: (id) => widget.metodo(id),
                                    ),
                                    Flexible(
                                      child: Text(
                                        "${widget.taskModel.Name}",
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: maxlinesAllowed,
                                        softWrap: false,
                                      ),
                                    ),
                                  ]
                              )
                          ),
                          ElevatedButton(
                            onPressed: (){
                              tvm.deleteATask(widget.taskModel.id.toString());
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DoneView()
                                  )
                              );
                            },
                            style:ElevatedButton.styleFrom(
                              backgroundColor: Color.fromRGBO(245, 247, 249, 1),
                              padding: EdgeInsets.all(1),
                              side: BorderSide.none,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(9.0),
                              ),
                            ),
                            child:
                            SvgPicture.asset(
                              'lib/assets/imgs/TrashIcon.svg',
                            )
                          )
                        ]
                    ),
                  ),
                ]
            ),
          )
        ]
      ),
    );
  }
}