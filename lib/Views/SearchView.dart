import 'package:desafiomobile/Models/TaskModel.dart';
import 'package:desafiomobile/ViewModels/TaskViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:desafiomobile/Widgets/UpBar.dart';
import 'package:desafiomobile/Widgets/TaskSearched.dart';
import 'package:desafiomobile/Widgets/Navigate.dart';
import 'package:flutter_svg/svg.dart';





class SearchView extends StatefulWidget {
  SearchView({Key? key}) : super(key: key);
  @override
  _SearchView createState() => _SearchView();
}


class _SearchView extends State<SearchView>{
  TaskModel taskModel = new TaskModel();
  TaskViewModel tvm = new TaskViewModel();
  TextEditingController _taskController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? title;


  Future<bool> searchTask(String task_name) async {
    TaskModel? task = await tvm.getTask(task_name);
    if(task != null){
      setState(() {
        this.taskModel = task;
      });
      print("${this.taskModel} \n\n\n");
      return true;
    }
    setState(() {
      this.taskModel = new TaskModel();
    });
    print(this.taskModel);
    return false;
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
                  child:SingleChildScrollView(
                      child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:[
                                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                                  Positioned(
                                      child:
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Color.fromRGBO(245, 247, 249,1),
                                          borderRadius: BorderRadius.circular(20), // Rounded corners
                                        ),
                                        width: MediaQuery.of(context).size.width * 0.9,
                                        child:
                                        Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children:[
                                              Container(
                                                width: MediaQuery.of(context).size.width * 0.2,
                                                child:
                                                ElevatedButton(
                                                    onPressed: ()=> {
                                                      this.searchTask(_taskController.text),
                                                      if(_formKey.currentState!.validate()){
                                                        _formKey.currentState!.save()
                                                      },
                                                    },
                                                    style: ElevatedButton.styleFrom(
                                                      backgroundColor: Color.fromRGBO(245, 247, 249, 1),
                                                      side: BorderSide.none,
                                                      shadowColor: Colors.transparent,
                                                      // foregroundColor: Color.fromRGBO(0, 127, 255, 1),
                                                      padding: EdgeInsets.symmetric(horizontal: 9, vertical: 15),
                                                      textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                                      shape: RoundedRectangleBorder(
                                                        side:BorderSide(
                                                          color:Color.fromRGBO(245, 247, 249, 1),
                                                          width: 0.0,
                                                        ),
                                                        // borderRadius: BorderRadius.only(
                                                        // topLeft: Radius.circular(20),
                                                        // bottomLeft: Radius.circular(20),
                                                        // ),
                                                      ),
                                                    ),
                                                    child: SvgPicture.asset("lib/assets/imgs/SearchIconBlue.svg")
                                                ),
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
                                                    fillColor: Color.fromRGBO(245, 247, 249, 1),
                                                    filled: true,
                                                    hintText: '',
                                                    enabledBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: Color.fromRGBO(245, 247, 249, 1),
                                                        width: 2.0,
                                                      ),
                                                    ),
                                                    focusedBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: Color.fromRGBO(245, 247, 249, 1),
                                                        width: 0.0,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                width: MediaQuery.of(context).size.width * 0.7,
                                              ),
                                            ]
                                        ),
                                      ),
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