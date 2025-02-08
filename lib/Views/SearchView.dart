import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:desafiomobile/Widgets/UpBar.dart';
import 'package:desafiomobile/Widgets/Navigate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:desafiomobile/ViewModels/TaskViewModel.dart';
import 'dart:async';



class SearchView extends StatefulWidget {
  SearchView({Key? key}) : super(key: key);

  @override
  _SearchView createState() => _SearchView();
}


class _SearchView extends State<SearchView>{
  @override
  Widget build (BuildContext context){
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: UpBar(),
          bottomNavigationBar: Navigate(),
          body:
          Center(
              child:
              Container(
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.height * 0.8,
                  color: Color.fromRGBO(255, 255, 255, 1),
                  child:SingleChildScrollView(
                      child: Form(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:[
                              SizedBox(height: MediaQuery.of(context).size.height * 0.3),
                              SvgPicture.asset(
                                'lib/assets/imgs/cadernetasIcon.svg',
                                fit: BoxFit.contain,
                              ),
                            ]
                        ),
                      )
                  )
              )
          ),
        )
    );
  }
}