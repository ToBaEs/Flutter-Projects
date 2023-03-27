import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rastgele Sayı Listesi',
      theme: ThemeData(
       brightness: Brightness.dark,
      ),
      home: const MyHomePage(title: 'Rastgele Sayı Listesi'),
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
   
  List<int> number = List.generate(5, (numbers) => Random().nextInt(100));
  

  void _numberCreate() {
    setState(() {
    number = List.generate(5, (numbers) => Random().nextInt(100));
    });
    
}
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        
      ),
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [ 
            GestureDetector(onTap: () {
              setState(() {
                _numberCreate();
              });
            },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Text("Yeniden Oluştur".toString(),
              ),
            )
            ),
            Expanded(child: ListView.builder(itemCount: number.length, itemBuilder:(context, index) {
              return ListTile(title: Center(
                child: Text(number[index].toString()),
              ),
              onTap: (){
                setState(() {
                  number.removeAt(index);
                });
              },
              );
            }
            ),
            )
          ],
        ),
      ),
    );
  }
  
}