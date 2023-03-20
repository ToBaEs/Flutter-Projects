import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sayaç V2',
      theme: ThemeData(
      //primarySwatch: Colors.red,
      brightness: Brightness.dark,

      ),
      home:  MyHomePage(title: 'Sayaç V2'),
    );
  }
}

class MyHomePage extends StatefulWidget {
   MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _fontSize = 40;
  int _counter = 0;


Color _textColour(int _counter){
  if(_counter > 0 ){
    return Colors.green;
  }
  else if(_counter == 0){
     return Colors.yellow;
  }
  else{
   return Colors.red;
  }
}


  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter(){
        setState(() {
          _counter--;
        });
  }

  void _incrementFontSize(){
    setState(() {
      _fontSize +=4 ;
    });
  }

   void _decrementFontSize(){
    setState(() {
      _fontSize -=4;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(onPressed: _incrementFontSize, icon: Icon(Icons.plus_one), 
          ),
          IconButton(onPressed: _decrementFontSize, icon: Icon(Icons.exposure_minus_1_outlined),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             Text(
              'Sayaç V2',
            ),
            Text(
              '$_counter',

              style: TextStyle(
              
              fontSize: _fontSize,
              
              color: _textColour(_counter),

              )
            ),
             Row(mainAxisAlignment: MainAxisAlignment.center,children: [
               SizedBox(width: 24),
        FloatingActionButton(onPressed: _decrementCounter,child: Icon(Icons.remove),backgroundColor: Colors.red,),
        SizedBox(width: 24),
        FloatingActionButton(onPressed: _incrementCounter,child: Icon(Icons.add),backgroundColor: Colors.green,),
      ],)
          ],
        ),
      ),
    );
  }
}
