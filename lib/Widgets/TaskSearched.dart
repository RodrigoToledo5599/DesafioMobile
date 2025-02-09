import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/cupertino.dart';

class TaskSearched extends StatefulWidget{
  final int? id;
  final String? Name;
  final String? Description;
  final int? Done;

  const TaskSearched({
    Key? key,
    this.id,
    this.Name,
    this.Description,
    this.Done,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            if(widget.id == null)
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
                child:Column(
                  children:[
                    Row(
                        children:[
                          Flexible(
                            child: Text(
                              "${widget.Name}",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              softWrap: false,
                            ),
                          ),
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
                                      maxLines: 4,
                                    ),
                                    SizedBox(width:MediaQuery.of(context).size.width * 0.1),
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