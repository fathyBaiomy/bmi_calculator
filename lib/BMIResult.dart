import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BMIResult extends StatelessWidget {
  String gender = "";
  int result = 0, age = 0;

  BMIResult.init(
      {required this.gender, required this.result, required this.age});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'results',
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            mainText(title: 'gender', value: '${gender}'),
            mainText(title: 'result', value: '${result}'),
            mainText(title: 'age', value: '${age}'),
          ],
        ),
      ),
    );
  }
}

Widget mainText({
  required String title,
  required String value,
}) {
  return Text(
    '$title : $value',
    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
  );
}
