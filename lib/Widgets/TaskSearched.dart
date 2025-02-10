import 'package:desafiomobile/Models/TaskModel.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/cupertino.dart';

class TaskSearched extends StatefulWidget{
  TaskModel taskModel = new TaskModel();

  TaskSearched({
    Key? key,
    required this.taskModel,
  }) : super(key: key);

  @override
  _TaskSearched createState() => _TaskSearched();

}

class _TaskSearched extends State<TaskSearched>{
  @override
  Widget build (BuildContext context){
    return
      Container(
        width: MediaQuery.of(context).size.width * 0.7,
      child:
      Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[
            if(widget.taskModel.IsEmpty())
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
              Container(
                height:MediaQuery.of(context).size.height * 0.2,
                child:Column(
                  children:[
                    Expanded(
                      child: Text(
                        "${widget.taskModel.Name}",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        softWrap: false,
                      ),
                    ),
                    Row(
                        children:[
                          Container(
                              width: MediaQuery.of(context).size.width * 0.7,
                              child:
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children:[
                                    // SizedBox(width:MediaQuery.of(context).size.width * 0.1),
                                    Text(
                                      "${widget.taskModel.Description}",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 4,
                                    ),
                                    // SizedBox(width:MediaQuery.of(context).size.width * 0.1),
                                  ]
                              )
                          )
                        ]
                    ),
                  ]
                )
              ),
          ]
      )
    );
  }
}