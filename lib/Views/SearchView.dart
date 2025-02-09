import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:desafiomobile/Widgets/UpBar.dart';
import 'package:desafiomobile/Widgets/TaskSearched.dart';
import 'package:desafiomobile/Widgets/Navigate.dart';
import 'package:desafiomobile/Widgets/TaskSearched.dart';





class SearchView extends StatefulWidget {
  SearchView({Key? key}) : super(key: key);

  @override
  _SearchView createState() => _SearchView();
}


class _SearchView extends State<SearchView>{
  TaskSearched taskSearched = new TaskSearched();
  final _formKey = GlobalKey<FormState>();
  String? title;
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
                            children:[
                              Row(
                                  children:[
                                    SizedBox(width: MediaQuery.of(context).size.width * 0.08),
                                    SizedBox(
                                      child: TextFormField(
                                        textAlignVertical: TextAlignVertical.bottom,
                                        onSaved: (val){
                                          setState((){
                                            title = val;
                                          });
                                        },
                                        decoration: InputDecoration(
                                          labelText: 'Task Name',
                                          hintText: '',
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(12),
                                            borderSide: BorderSide(
                                              color: Color.fromRGBO(0, 127, 255, 0.5),
                                              width: 2.0,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(12),
                                            borderSide: BorderSide(
                                              color: Color.fromRGBO(0, 127, 255, 0.5),
                                              width: 2.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      width: MediaQuery.of(context).size.width * 0.84,
                                    ),
                                    SizedBox(width: MediaQuery.of(context).size.width * 0.08)
                                  ]
                              ),
                              TaskSearched(),
                            ]
                        ),
                      )
                  )
              )
          ),
        );
  }
}