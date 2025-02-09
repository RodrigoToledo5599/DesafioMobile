import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:desafiomobile/Widgets/UpBar.dart';
import 'package:desafiomobile/Widgets/Navigate.dart';
import 'package:desafiomobile/Views/CreatingTaskView.dart';



class CreateView extends StatelessWidget{


  const CreateView({Key? key}) : super(key: key);

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
                  height: MediaQuery.of(context).size.height * 1,
                  color: Color.fromRGBO(255, 255, 255, 1),
                  child:SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:[
                          SizedBox(height: MediaQuery.of(context).size.height * 0.3),
                          SvgPicture.asset(
                            'lib/assets/imgs/cadernetasIcon.svg',
                            fit: BoxFit.contain,
                          ),
                          ElevatedButton(
                            onPressed:(){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => CreatingTaskView()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromRGBO(0, 127, 255, 0.1), // Button color
                              foregroundColor: Color.fromRGBO(0, 127, 255, 1),
                              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15), // Padding
                              textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), // Text style
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10), // Rounded corners
                              ),
                            ),
                            child:
                            Container(
                                width: 120,
                                child:
                                Row(
                                    children:[
                                      Icon(
                                        Icons.add,
                                      ),
                                      Text(
                                        "Create Task",
                                      )
                                    ]
                                )
                            ),
                          ),
                        ]
                    ),
                  )
              )
          ),
        )
    );
  }
}