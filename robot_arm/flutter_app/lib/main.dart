import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyHome(),
        routes: <String, WidgetBuilder>{
          '/RobotArm': (context) => Robot_Arm(),
          '/home': (context) => MyHome()
        });
  }
}

class MyHome extends StatefulWidget {
  _MyHome createState() => _MyHome();
}

class _MyHome extends State<MyHome> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: Center(
            child: Column(
          children: <Widget>[
            FlatButton(
                color: Colors.blueAccent,
                onPressed: () {
                  Navigator.pushNamed(context, '/RobotArm');
                },
                child: Text('Robot Arm'))
          ],
        )));
  }
}

class BNBCustomPointer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;
    Path path = Path()..moveTo(0, 20);
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width * 0.60, 20),
        radius: Radius.circular(10.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    path.close();
    canvas.drawPath(path, paint);
  }

  bool shouldRepaint(CustomPainter oldDelgete) {
    return false;
  }
}

class Robot_Arm extends StatefulWidget {
  _Robot_Arm createState() => _Robot_Arm();
}

class _Robot_Arm extends State<Robot_Arm> {
  @override
  Widget bottom_bar() {
    final Size size = MediaQuery.of(context).size;

    return Container(
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              width: size.width,
              height: 80,
              child: Stack(
                children: [
                  CustomPaint(
                    size: Size(size.width, 80),
                    painter: BNBCustomPointer(),
                  ),
                  Center(
                    heightFactor: 0.6,
                    child: FloatingActionButton(
                      onPressed: () {},
                      backgroundColor: Colors.blueAccent,
                      child: Icon(Icons.camera),
                      elevation: 0.1,
                    ),
                  ),
                  Container(
                    width: size.width,
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                            icon: Icon(
                              Icons.home,
                              color: Colors.blueAccent,
                            ),
                            onPressed: () {}),
                        IconButton(
                            icon: Icon(
                              Icons.settings_input_component,
                              color: Colors.blueAccent,
                            ),
                            onPressed: () {}),
                        Container(
                          width: size.width * 0.20,
                        ),
                        IconButton(
                            icon: Icon(
                              Icons.map_sharp,
                              color: Colors.blueAccent,
                            ),
                            onPressed: () {}),
                        IconButton(
                            icon: Icon(
                              Icons.photo_camera_outlined,
                              color: Colors.blueAccent,
                            ),
                            onPressed: () {}),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget portier() {
    return Container(
        child: Stack(children: [
      Positioned(
        bottom: 130,
        right: 20,
        child: Container(
            child: FloatingActionButton(
          heroTag: 'next1',
          onPressed: () {},
          child: Icon(
            Icons.arrow_forward,
            color: Colors.blueAccent,
          ),
          backgroundColor: Color(0xff41474A),
        )),
      ),
      Positioned(
        bottom: 130,
        right: 110,
        child: Container(
            child: FloatingActionButton(
                heroTag: 'next2',
                onPressed: () {},
                child: Icon(
                  Icons.arrow_back_outlined,
                  color: Colors.blueAccent,
                ),
                backgroundColor: Color(0xff41474A))),
      ),
      Positioned(
        bottom: 80,
        right: 60,
        child: Container(
            child: FloatingActionButton(
                heroTag: 'next3',
                onPressed: () {},
                child: Icon(
                  Icons.arrow_downward,
                  color: Colors.blueAccent,
                ),
                backgroundColor: Color(0xff41474A))),
      ),
      Positioned(
        bottom: 180,
        right: 60,
        child: Container(
            child: FloatingActionButton(
                heroTag: 'next4',
                onPressed: () {},
                child: Icon(
                  Icons.arrow_upward,
                  color: Colors.blueAccent,
                ),
                backgroundColor: Color(0xff41474A))),
      ),
      Positioned(
        bottom: 600,
        right: 20,
        child: Container(
            child: RaisedButton(
                onPressed: () {},
                child: Icon(
                  Icons.arrow_forward,
                  color: Colors.blueAccent,
                ),
                color: Color(0xff41474A))),
      ),
      Positioned(
        bottom: 600,
        right: 120,
        child: Container(
            child: RaisedButton(
                onPressed: () {},
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.blueAccent,
                ),
                color: Color(0xff41474A))),
      ),
      bottom_bar()
    ]));
  }

  Widget landscape() {
    return bottom_bar();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff41474A),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.blue,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/home');
            },
          ),
          title: Text(
            "Robot Arm Control",
            style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w300),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        backgroundColor: Color(0xff41474A),
        body: OrientationBuilder(
          builder: (context, orientation) {
            if (orientation == Orientation.portrait) {
              return portier();
            } else {
              return landscape();
            }
          },
        ));
  }
}
