import 'package:flutter/material.dart';
import 'package:long_embedded_app/multiview.dart';
import 'package:long_embedded_app/resizer.dart';

void main() {
  runWidget(MultiViewApp(viewBuilder: (context) => MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: ResizerWidget(child: MainWidget()),
      ),
    );
  }
}


class MainWidget extends StatelessWidget {
  const MainWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: List.generate(50, (index) => Container(
        color: Colors.orangeAccent,
        padding: EdgeInsets.all(20),
        height: 100,
        child: Center(child: Text("CONTAINER ${index+1}", style: TextStyle(color: Colors.white, fontSize: 10),)),
      ),),
    );
  }
}
