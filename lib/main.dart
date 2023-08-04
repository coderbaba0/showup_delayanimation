import 'package:flutter/material.dart';
import 'package:showup_textanimation/showup.dart';

import 'containeranimate.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Showup Animation ',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutterfever.com'),
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
  int delayAmount = 100;
  Map<String, String> map1 = {"0": 'click on me', "1": "me too", "2": "Two"};
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            //Note that this "ShowUp" widgets can animate anything, not just texts.
            // loading delay animation
            ShowUp(
              child: Text("first show",style: TextStyle(color: Colors.purple,fontSize: 35)),
              delay: delayAmount,
            ),
            ShowUp(
              child: Text("Second show",style: TextStyle(color: Colors.yellow,fontSize: 35)),
              delay: delayAmount + 500,
            ),
            ShowUp(
              child: Column(
                children: <Widget>[
                  Text("Texts 1  flutterfever.com",style: TextStyle(color: Colors.pink,fontSize: 25),),
                  Text("Texts 2 flutterfever.com",style: TextStyle(color: Colors.green,fontSize: 20)),
                  Text("Texts  3 flutterfever.com",style: TextStyle(color: Colors.purple,fontSize: 15)),
                ],
              ),
              delay: delayAmount + 900,
            ),
            //on tap container animation
            Animated(
                items: map1,
                animationDuration: const Duration(milliseconds: 400),
                onTap: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                }),
          ],
        ),
      ),
    );
  }
}
