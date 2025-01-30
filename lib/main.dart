import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  void _decrementCounter(){
    setState((){
      _counter--;
    });
  }
  void _equalszero(){
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(
              height:60,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  IconButton(
                    icon: Icon(
                      Icons.exposure_plus_1,
                      size:40,
                    ),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Color.fromRGBO(255, 255, 255, 1),
                      backgroundColor: Color.fromRGBO(0, 0, 0, 1),
                      textStyle: TextStyle(fontSize: 20),
                      padding: EdgeInsets.all(12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9.0),
                      ),
                    ),
                    onPressed: () async {
                      _incrementCounter();
                    },
                  ),
                  SizedBox(width:80),
                  IconButton(
                    icon: Icon(
                      Icons.exposure_zero,
                      size:40,
                    ),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Color.fromRGBO(255, 255, 255, 1),
                      backgroundColor: Color.fromRGBO(0, 0, 0, 1),
                      textStyle: TextStyle(fontSize: 20),
                      padding: EdgeInsets.all(12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9.0),
                      ),
                    ),
                    onPressed: () async {
                      _equalszero();
                    },
                  ),
                  SizedBox(width:80),
                  IconButton(
                    icon: Icon(
                      Icons.exposure_minus_1,
                      size:40,
                    ),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Color.fromRGBO(255, 255, 255, 1),
                      backgroundColor: Color.fromRGBO(0, 0, 0, 1),
                      textStyle: TextStyle(fontSize: 20),
                      padding: EdgeInsets.all(12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9.0),
                      ),
                    ),
                    onPressed: () async {
                      _decrementCounter();
                    },
                  ),

                ]
              )
            // This trailing comma makes auto-formatting nicer for build methods.
          ],
        ),
      ),
    );
  }
}
