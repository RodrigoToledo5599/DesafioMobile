import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:desafiomobile/Views/Todo.dart';
import 'package:desafiomobile/Views/Create.dart';
import 'package:desafiomobile/Views/Search.dart';
import 'package:desafiomobile/Views/Done.dart';




class Navigate extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.08,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Todo()
                    )
                );
              },
                icon: Icon(
                  Icons.list,
                  size: 35,
                ),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Color.fromRGBO(13, 34, 61, 1),
                  textStyle: TextStyle(fontSize: 18),
                  padding: EdgeInsets.all(15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9.0),
                  ),
                ),
              ),





              IconButton(onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Create()
                    )
                );
              },
                icon: Icon(
                    Icons.create,
                    size:35
                ),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Color.fromRGBO(13, 34, 61, 1),
                  // backgroundColor: Color.fromRGBO(13, 34, 61, 1),
                  textStyle: TextStyle(fontSize: 18),
                  padding: EdgeInsets.all(15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9.0),
                  ),
                ),
              ),




              IconButton(onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Search()
                    )
                );
              },
                icon: Icon(
                  Icons.search,
                  size: 35,
                ),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Color.fromRGBO(13, 34, 61, 1),
                  textStyle: TextStyle(fontSize: 18),
                  padding: EdgeInsets.all(15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9.0),
                  ),
                ),
              ),







              IconButton(onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Done()
                    )
                );
              },
                icon: Icon(
                  Icons.check_box,
                  size: 35,
                ),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Color.fromRGBO(13, 34, 61, 1),
                  textStyle: TextStyle(fontSize: 18),
                  padding: EdgeInsets.all(15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9.0),
                  ),
                ),
              ),






            ]
        )
    );
  }
}