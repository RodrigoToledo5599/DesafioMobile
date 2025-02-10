import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:desafiomobile/ViewModels/TaskViewModel.dart';
import 'package:desafiomobile/Views/TodoView.dart';
import 'package:desafiomobile/Widgets/MinimumWidgets/CustomCheckBox.dart';
import 'dart:async';



class CreateTask extends StatefulWidget {
  CreateTask({Key? key}) : super(key: key);

  @override
  _CreateTask createState() => _CreateTask();

}
class _CreateTask extends State<CreateTask>{
  bool isChecked = false;
  final _formKey = GlobalKey<FormState>();
  TaskViewModel tvm = new TaskViewModel();
  String? title, description;

  void updateCheckBoxState(bool value) {
    setState(() {
      isChecked = value;
    });
  }

  Widget build (BuildContext context){

    return
      Container(
        margin: EdgeInsets.only(top: 9),
        width: MediaQuery.of(context).size.width * 1,
        height: MediaQuery.of(context).size.height * 0.60,
        // color: Color.fromRGBO(255, 255, 255, 1),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(18)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.7),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child:
            Container(
              color: Color.fromRGBO(255, 255, 255, 0),
              width: MediaQuery.of(context).size.width * 0.6,
              child:
                  Form(
                    key: _formKey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children:[
                          Row(
                              children:[
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.096,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.07,
                                  child: CustomCheckBox(
                                    controlVariable: isChecked,
                                    onChanged: updateCheckBoxState,
                                  ),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.075,
                                ),
                                SizedBox(
                                  child: TextFormField(
                                    textAlignVertical: TextAlignVertical.bottom,
                                    onSaved: (val){
                                      setState((){
                                        title = val;
                                      });
                                    },
                                    decoration: const InputDecoration(
                                      labelText: "What's on your mind?",
                                      labelStyle: TextStyle(color:Color.fromRGBO(198, 207, 220, 1)),
                                      border: InputBorder.none,
                                      contentPadding:
                                      EdgeInsets.only(bottom: 40.0, right: 10.0),
                                    ),
                                  ),
                                  width: MediaQuery.of(context).size.width * 0.55,
                                ),
                              ]
                          ),
                          Row(
                              children:[
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.096,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.07,
                                  child: Icon(
                                    Icons.create,
                                    size: 28,
                                    color: Color.fromRGBO(198, 207, 220, 1),
                                  ),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.075,
                                ),
                                SizedBox(
                                  child: TextFormField(
                                    textAlignVertical: TextAlignVertical.bottom,
                                    onSaved: (val){
                                      setState((){
                                        description = val;
                                      });
                                    },
                                    decoration: const InputDecoration(
                                      labelStyle: TextStyle(color:Color.fromRGBO(198, 207, 220, 1)),
                                      labelText: "Add a note...",
                                      border: InputBorder.none,
                                      contentPadding:
                                      EdgeInsets.only(bottom: 40.0, right: 10.0),
                                    ),
                                  ),
                                  width: MediaQuery.of(context).size.width * 0.55,
                                ),
                              ]
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children:[
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    foregroundColor: Colors.blue,
                                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                                    textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                    shadowColor: Colors.transparent, // No shadow
                                  ),
                                  onPressed: () {
                                    if(_formKey.currentState!.validate()){
                                      _formKey.currentState!.save();
                                      tvm.createTask(title, description, isChecked);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => TodoView(),
                                          )
                                      );
                                    }
                                  },
                                  child: Text("Create")
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.066,
                              ),
                            ]
                          )
                        ]
                    ),
                  )
            ),
        );
  }
}