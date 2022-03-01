import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('BMI calculator'),
        ),
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: BoxContainer(
                          child:
                              MaleFemaleWidget(text: 'male', icon: Icons.male)),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: BoxContainer(
                          child: MaleFemaleWidget(
                              text: 'female', icon: Icons.female)),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                color: Colors.red,
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                color: Colors.blue,
              ),
            ),
            Container(
              color: Colors.red,
              width: double.infinity,
              child: MaterialButton(
                onPressed: () {},
                child: Text(
                  'calculate',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget MaleFemaleWidget({required String text, required IconData icon}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        text,
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(
        height: 15,
      ),
      Icon(
        icon,
        size: 70,
      )
    ],
  );
}

Widget BoxContainer({required Widget child, Color color = Colors.grey}) =>
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
      child: child,
    );
