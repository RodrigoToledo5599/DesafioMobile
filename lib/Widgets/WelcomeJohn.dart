import 'package:flutter/cupertino.dart';
import 'package:desafiomobile/Widgets/WelcomeJohn.dart';




class WelcomeJohn extends StatelessWidget{

  final int numberOfTasks;
  const WelcomeJohn({Key? key, required this.numberOfTasks}) : super(key: key);


  @override
  Widget build (BuildContext context){
    return Container(
      child:
          Column(
            children:[
              Row(
                children: [
                  SizedBox(width: MediaQuery.sizeOf(context).width * 0.08),
                  Text(
                      "Welcome, ",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w900,
                      )
                  ),
                  Text(
                      "John",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w900,
                        color: Color.fromRGBO(0, 127, 255, 1),
                      )
                  ),
                ],
              ),
              if(numberOfTasks >0)
                Row(
                  children:[
                    SizedBox(width: MediaQuery.sizeOf(context).width * 0.08),
                    Text(
                        "You've got $numberOfTasks tasks to do.",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Urbanist',
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(37, 150, 190, 0.8),
                        )
                    )
                  ]
                )
              else if (numberOfTasks == 0)
                Row(
                    children:[
                      SizedBox(width: MediaQuery.sizeOf(context).width * 0.08),
                      Text(
                          "Create tasks to achieve more.",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Urbanist',
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(37, 150, 190, 0.8),
                          )
                      )
                    ]
                )
            ]
          ),
    );
  }



}