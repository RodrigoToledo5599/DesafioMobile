import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';


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
                        SizedBox(width: MediaQuery.sizeOf(context).width * 0.075),
                        SvgPicture.asset('lib/assets/imgs/checklistImg.svg'),
                        Text(
                          " Taski",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontFamily: 'Urbanist',
                            fontWeight: FontWeight.w600,
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
                            "John  ",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Urbanist',
                              fontWeight: FontWeight.w600,
                              fontSize: 18, // Font size
                              letterSpacing: 1.5, // Letter spacing
                            ),
                          ),
                          ClipOval(
                            child:Image.asset(
                              'lib/assets/imgs/JohnFace.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: MediaQuery.sizeOf(context).width * 0.075),
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