import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:desafiomobile/Views/TodoView.dart';
import 'package:desafiomobile/Views/CreateView.dart';
import 'package:desafiomobile/Views/SearchView.dart';
import 'package:desafiomobile/Views/DoneView.dart';
import 'package:flutter_svg/svg.dart';




class Navigate extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container(
        color:Color.fromRGBO(255, 255, 255, 1),
        height: MediaQuery.of(context).size.height * 0.1,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: MediaQuery.of(context).size.width * 0.01),
              ElevatedButton(onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TodoView()
                    )
                );
              },
                child:
                    Container(
                      child:
                      Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children:[
                            SvgPicture.asset('lib/assets/imgs/TodoIcon.svg'),
                            Text("Todo")
                          ]
                      ),
                    ),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Color.fromRGBO(198, 207, 220, 1),
                  backgroundColor: Color.fromRGBO(255, 255, 255, 1),
                  padding: EdgeInsets.all(15),
                  side: BorderSide.none,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9.0),
                  ),
                ),
              ),





              ElevatedButton(onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CreateView()
                    )
                );
              },
                child:
                    Container(
                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children:[
                            SvgPicture.asset('lib/assets/imgs/CreateIcon.svg'),
                            Text("Create")
                          ]
                      ),
                    ),

                style: ElevatedButton.styleFrom(
                  foregroundColor: Color.fromRGBO(198, 207, 220, 1),
                  backgroundColor: Color.fromRGBO(255, 255, 255, 1),
                  side: BorderSide.none,
                  elevation: 0,
                  padding: EdgeInsets.all(15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9.0),
                  ),
                ),
              ),




              ElevatedButton(onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SearchView()
                    )
                );
              },
                child:
                    Container(
                      child:
                      Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children:[
                            SvgPicture.asset('lib/assets/imgs/SearchIcon.svg'),
                            Text("Search")
                          ]
                      ),
                    ),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Color.fromRGBO(198, 207, 220, 1),
                  backgroundColor: Color.fromRGBO(255, 255, 255, 1),
                  side: BorderSide.none,
                  elevation: 0,
                  padding: EdgeInsets.all(15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9.0),
                  ),
                ),
              ),







              ElevatedButton(
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DoneView()
                      )
                  );
              },
                child:
                Container(
                  child:
                  Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:[
                        SvgPicture.asset('lib/assets/imgs/DoneIcon.svg'),
                        Text("Done")
                      ]
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Color.fromRGBO(198, 207, 220, 1),
                  backgroundColor: Color.fromRGBO(255, 255, 255, 1),
                  side: BorderSide.none,
                  elevation: 0,
                  padding: EdgeInsets.all(15),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9.0),
                  ),
                ),
              ),

              SizedBox(width: MediaQuery.of(context).size.width * 0.01),
            ]
        )
    );
  }
}