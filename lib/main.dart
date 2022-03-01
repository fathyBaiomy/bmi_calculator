import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isMale = true;
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
                      child: InkWell(
                        child: BoxContainer(
                            color: isMale ? Colors.blue : Colors.grey,
                            child: MaleFemaleWidget(
                                text: 'male',
                                path: "assets/images/male.png",
                                color: Colors.black)),
                        onTap: () {
                          setState(() {
                            isMale = true;
                          });
                        },
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            isMale = false;
                          });
                        },
                        child: BoxContainer(
                            color: !isMale ? Colors.blue : Colors.grey,
                            child: MaleFemaleWidget(
                                text: 'female',
                                path: "assets/images/female.png",
                                color: Colors.black)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: BoxContainer(child: SliderWidget()),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: BoxContainer(
                            child: valueWidget(title: 'weight', value: '70'))),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        child: BoxContainer(
                            child: valueWidget(title: 'height', value: '180'))),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.blue,
              width: double.infinity,
              child: MaterialButton(
                height: 60,
                onPressed: () {},
                child: Text(
                  'calculate',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget MaleFemaleWidget(
    {required String text, required String path, Color color = Colors.black}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image(
        image: AssetImage(path),
        width: 90,
        color: color,
      ),
      SizedBox(
        height: 15,
      ),
      Text(
        text,
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  );
}

Widget SliderWidget(
    {double value = 120, double minValue = 80, double maxValue = 220}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text("Height",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          )),
      heightText(value: '180', type: 'cm'),
      Slider(
        value: value,
        max: maxValue,
        min: minValue,
        onChanged: (value) {
          print(value.round());
        },
      )
    ],
  );
}

Widget valueWidget({required String title, String value = "20"}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        title,
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
      Text(
        value,
        style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            mini: true,
            onPressed: () {},
            child: Icon(Icons.remove),
          ),
          FloatingActionButton(
            mini: true,
            onPressed: () {},
            child: Icon(Icons.add),
          ),
        ],
      )
    ],
  );
}

Widget heightText({required String value, required String type}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.baseline,
    // mainAxisSize: MainAxisSize.m,
    mainAxisAlignment: MainAxisAlignment.center,
    textBaseline: TextBaseline.alphabetic,
    children: [
      Text(value,
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w900,
          )),
      SizedBox(
        width: 5,
      ),
      Text(type,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          )),
    ],
  );
}

Widget BoxContainer({required Widget child, Color color = Colors.grey}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: color,
    ),
    child: child,
  );
}
