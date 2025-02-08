import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';


class UpBar extends StatelessWidget implements PreferredSizeWidget{
  const UpBar({Key? key}) : super(key: key);

  @override
  Widget build (BuildContext context){
    return AppBar(
      actions: [
        Container(
          width: MediaQuery.sizeOf(context).width * 1,
          child:
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:[
                Container(
                  child: Row(
                      children:[
                        SizedBox(width: MediaQuery.sizeOf(context).width * 0.05),
                        Icon(
                          Icons.check_box,
                          color: Colors.blue,
                          size: 33,
                        ),
                        Text(
                          "Taski",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            letterSpacing: 1.5,
                          ),
                        ),
                      ]
                  ),
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
                Container(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    child:
                    Row(
                        children:[
                          Text(
                            "John",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16, // Font size
                              letterSpacing: 1.5, // Letter spacing
                            ),
                          ),
                          Icon(
                            Icons.account_circle,
                            color: Colors.blue,
                            size: 30,
                          ),
                          SizedBox(width: MediaQuery.sizeOf(context).width * 0.05),
                        ]
                    )
                ),
              ]
          ),
        ),
      ],
      backgroundColor: Colors.white,
    );
  }
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

}