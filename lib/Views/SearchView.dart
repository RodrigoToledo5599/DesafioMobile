import 'package:desafiomobile/Models/TaskModel.dart';
import 'package:desafiomobile/ViewModels/TaskViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:desafiomobile/Widgets/UpBar.dart';
import 'package:desafiomobile/Widgets/TaskSearched.dart';
import 'package:desafiomobile/Widgets/Navigate.dart';
import 'package:flutter_svg/svg.dart';





class SearchView extends StatefulWidget {
  SearchView({
    Key? key,
  }) : super(key: key);

  @override
  _SearchView createState() => _SearchView();
}


class _SearchView extends State<SearchView>{
  TaskModel taskModel = new TaskModel();
  TaskViewModel tvm = new TaskViewModel();
  TextEditingController _taskController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? title;


  Future<String> searchTask(String task_name) async {
    Map<String,dynamic>? task = await tvm.getTask(task_name);
    print(task);

    if(task != null){
      setState(() {
        this.taskModel.getFromMapString(task);
      });
    }

    setState(() {
      this.taskModel = new TaskModel();
    });

    print(this.taskModel);
    return "";
  }



  @override
  Widget build (BuildContext context){
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: UpBar(),
          bottomNavigationBar: Navigate(),
          body:
              Container(
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.height * 1,
                  color: Color.fromRGBO(255, 255, 255, 1),
                  // color: Color.fromRGBO(0, 0, 0, 1),
                  child:SingleChildScrollView(
                      child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:[
                                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                                  Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children:[
                                        ElevatedButton(
                                            onPressed: ()=> {
                                              this.searchTask(_taskController.text),
                                              if(_formKey.currentState!.validate()){
                                                _formKey.currentState!.save()
                                              },
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Color.fromRGBO(245, 247, 249, 1),
                                              foregroundColor: Color.fromRGBO(0, 127, 255, 1),
                                              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                                              textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                              shape: RoundedRectangleBorder(
                                                side:BorderSide(
                                                  color:Color.fromRGBO(0, 127, 255, 1),
                                                  width: 1.0,
                                                ),
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(20),
                                                  bottomLeft: Radius.circular(20),
                                                ),
                                              ),
                                            ),
                                            child: SvgPicture.asset("lib/assets/imgs/SearchIconBlue.svg")
                                        ),
                                        SizedBox(
                                          child: TextFormField(
                                            controller: _taskController,
                                            textAlignVertical: TextAlignVertical.bottom,
                                            onSaved: (val){
                                              setState((){
                                                title = val;
                                              });
                                            },
                                            decoration: InputDecoration(
                                              labelText: 'Task Name',
                                              fillColor: Color.fromRGBO(245, 247, 249, 1),
                                              filled: true,
                                              hintText: '',
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(20),
                                                  bottomRight: Radius.circular(20),
                                                ),
                                                borderSide: BorderSide(
                                                  color: Color.fromRGBO(0, 127, 255, 1),
                                                  width: 1.0,
                                                ),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(20),
                                                  bottomRight: Radius.circular(20),
                                                ),
                                                borderSide: BorderSide(
                                                  color: Color.fromRGBO(0, 127, 255, 0.5),
                                                  width: 1.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                          width: MediaQuery.of(context).size.width * 0.7,
                                        ),
                                      ]
                                  ),
                                SizedBox(height: MediaQuery.of(context).size.height * 0.15),
                                TaskSearched(taskModel: taskModel),
                              ]
                          ),
                        )
                      ),
                  )
              )
          );
  }
}