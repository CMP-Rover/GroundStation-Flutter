import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:control_pad/control_pad.dart';
import 'package:control_button/control_button.dart';
import 'package:slider_button/slider_button.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;

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
          '/home': (context) => MyHome(),
          '/CemeraView': (context) => Camera_View(),
          '/MapView': (context) => Map_View()
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

class BNBCustomPointer_landscape extends CustomPainter {
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
  void initState() {
    // TODO: implement initState

    super.initState();

    //SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom],);

    //print('initState function ran');
    //Future.delayed(const Duration(seconds: 3), () => "3");
  }

  @override
  void dispose() {
    // TODO: implement
    //SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values,);
    super.dispose();
  }

  Widget landscape() {
    String text = '';
    final movement =
        IOWebSocketChannel.connect("wss://cmp-rover.herokuapp.com/movement");
    void updateState(String showText) {
      setState(() {
        text = showText;
      });
    }

    double size = MediaQuery.of(context).size.width;
    return SafeArea(
      child: RotatedBox(
        quarterTurns: 1,
        child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: <Color>[
                Color(0xff616364),
                Color(0xff2B3134),
              ], begin: Alignment.bottomLeft, end: Alignment.topRight),
            ),
            child: Stack(children: [
              Positioned(
                top: (20 / 392.72) * MediaQuery.of(context).size.width,
                left: (50 / 821.81) * MediaQuery.of(context).size.height,
                child: FlatButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.backspace_rounded,
                    color: Colors.blue,
                    size: 16.0,
                  ),
                  label: Text(
                    'BACK',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.grey,
                        fontFamily: 'BNK',
                        fontSize: 16.0),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),

              Positioned(
                  top: (30 / 392.72) * MediaQuery.of(context).size.width,
                  right: (MediaQuery.of(context).size.height - (375)) / 2,
                  child: Container(
                    child: Text(
                      "Robot Arm Control",
                      style: TextStyle(
                          color: Colors.white, fontSize: 28, fontFamily: 'BNK'),
                    ),
                  )),
              Positioned(
                bottom: (80 / 392.72) * MediaQuery.of(context).size.width,
                right: (70 / 821.82) * MediaQuery.of(context).size.height,
                child: Container(
                  child: ClayContainer(
                    color: Color(0xff41474A),
                    height: 55,
                    width: 55,
                    borderRadius: 30,
                    spread: 1,
                    curveType: CurveType.none,
                    child: Center(
                      child: FlatButton(
                        onPressed: () {},
                        height: 55,
                        child: Icon(
                          Icons.arrow_forward_rounded,
                          color: Colors.blueAccent,
                        ),
                        shape: CircleBorder(),
                      ),
                    ),
                  ),
                ),
              ) //right
              ,
              Positioned(
                bottom: (80 / 392.72) * MediaQuery.of(context).size.width,
                right: (170 / 821.82) * MediaQuery.of(context).size.height,
                child: Container(
                  child: ClayContainer(
                    color: Color(0xff41474A),
                    height: 55,
                    width: 55,
                    borderRadius: 30,
                    spread: 1,
                    curveType: CurveType.none,
                    child: Center(
                      child: FlatButton(
                        onPressed: () {},
                        height: 55,
                        child: Icon(
                          Icons.arrow_back_rounded,
                          color: Colors.blueAccent,
                        ),
                        shape: CircleBorder(),
                      ),
                    ),
                  ),
                ),
              ), //left
              Positioned(
                bottom: (30 / 392.72) * MediaQuery.of(context).size.width,
                right: (120 / 821.82) * MediaQuery.of(context).size.height,
                child: Container(
                  child: ClayContainer(
                    color: Color(0xff41474A),
                    height: 55,
                    width: 55,
                    borderRadius: 30,
                    spread: 1,
                    curveType: CurveType.none,
                    child: Center(
                      child: FlatButton(
                        onPressed: () {},
                        height: 55,
                        child: Icon(
                          Icons.arrow_downward_rounded,
                          color: Colors.blueAccent,
                        ),
                        shape: CircleBorder(),
                      ),
                    ),
                  ),
                ),
              ), //down
              Positioned(
                bottom: (130 / 392.72) * MediaQuery.of(context).size.width,
                right: (120 / 821.82) * MediaQuery.of(context).size.height,
                child: Container(
                  child: ClayContainer(
                    color: Color(0xff41474A),
                    height: 55,
                    width: 55,
                    borderRadius: 30,
                    spread: 1,
                    curveType: CurveType.none,
                    child: Center(
                      child: FlatButton(
                        onPressed: () {},
                        height: 55,
                        child: Icon(
                          Icons.arrow_upward_outlined,
                          color: Colors.blueAccent,
                        ),
                        shape: CircleBorder(),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: (270 / 392.72) * MediaQuery.of(context).size.width,
                right: (60 / 821.82) * MediaQuery.of(context).size.height,
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
                bottom: (270 / 392.72) * MediaQuery.of(context).size.width,
                right: (180 / 821.82) * MediaQuery.of(context).size.height,
                child: Container(
                    child: RaisedButton(
                        onPressed: () {},
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.blueAccent,
                        ),
                        color: Color(0xff41474A))),
              ),
              Positioned(
                bottom: (30 / 392.72) * MediaQuery.of(context).size.width,
                left: (60 / 821.82) * MediaQuery.of(context).size.height,
                child: Container(
                    child: StreamBuilder(
                        stream: movement.stream,
                        builder: (context, snapshot) {
                          return JoystickView(
                            size: 150,
                            showArrows: false,
                            interval: Duration(seconds: 1),
                            onDirectionChanged: (degrees, distance) {
                              movement.sink.add(
                                  '{"Degree" : ${degrees.toInt()}, "Distance" : ${distance.toStringAsFixed(2)}}');
                            },
                          );
                        })),
              ),
              Positioned(
                  top: (30 / 392.72) * MediaQuery.of(context).size.width,
                  right: (190 / 821.82) * MediaQuery.of(context).size.height,
                  child: Image(
                    image: AssetImage('assets/arm.png'),
                    height: (420 / 392.72) * MediaQuery.of(context).size.width,
                    width: (420 / 821.82) * MediaQuery.of(context).size.height,
                  )),
            ])),
      ),
    );
  }

  Widget build(BuildContext context) {
    return landscape();
  }
}

class Camera_View extends StatefulWidget {
  _Camera_View createState() => _Camera_View();
}

class _Camera_View extends State<Camera_View> {
  @override
  Widget landscape() {
    return RotatedBox(
      quarterTurns: 1,
      child: Container(
          child: Stack(children: [
        Positioned(
          top: (20 / 392.72) * MediaQuery.of(context).size.width,
          left: (50 / 821.81) * MediaQuery.of(context).size.height,
          child: FlatButton.icon(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.backspace_rounded,
              color: Colors.blue,
              size: 16.0,
            ),
            label: Text(
              'BACK',
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Colors.grey,
                  fontFamily: 'BNK',
                  fontSize: 16.0),
              textAlign: TextAlign.left,
            ),
          ),
        ),
        Positioned(
            bottom: (30 / 392.72) * MediaQuery.of(context).size.width,
            left: (MediaQuery.of(context).size.height - 180) / 2,
            child: SliderButton(
              action: () {
                ///Do something here OnSlide
                Navigator.popAndPushNamed(context, '/mapview');
              },

              ///Put label over here
              label: Text(
                "Camera",
                style: TextStyle(
                    color: Color(0xff4a4a4a),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'BNK',
                    fontSize: 20),
              ),
              icon: Center(
                  child: Icon(
                Icons.map,
                color: Colors.white,
                size: 30.0,
                semanticLabel: 'Text to announce in accessibility modes',
              )),

              //Put BoxShadow here
              boxShadow: BoxShadow(
                color: Colors.black,
                blurRadius: 4,
              ),

              //Adjust effects such as shimmer and flag vibration here
              // shimmer: true,
              // vibrationFlag: true,

              ///Change All the color and size from here.
              width: 180,
              radius: 50,
              buttonColor: Color(0xff2B3134),
              backgroundColor: Colors.blueAccent,
              highlightedColor: Colors.grey,
              baseColor: Colors.white,
            )),
      ])),
    );
  }

  ///////////////////

  //Positioned(bottom: 30,right: 270,child:  RaisedButton(padding: EdgeInsets.symmetric(vertical: 16,horizontal: 60),shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),onPressed:(){Navigator.pushNamed(context, '/MapView');},color: Colors.blueAccent,child: Text("MAP",style: TextStyle(color: Colors.white,fontSize: 23),),),)
//Positioned(bottom: 32,right: 250,child: FloatingActionButton(heroTag: 'next8',onPressed: (){},child: Icon(Icons.photo_camera,color: Colors.blueAccent,),backgroundColor: Color(0xff41474A)),),
  ///////////////////

  /////////////////////////////

  Widget build(BuildContext context) {
    return landscape();
  }
}

class Map_View extends StatefulWidget {
  _Map_View createState() => _Map_View();
}

class _Map_View extends State<Map_View> {
  @override
  Widget landscape() {
    return RotatedBox(
      quarterTurns: 1,
      child: Container(
          child: Stack(children: [
        Positioned(
          top: (20 / 392.72) * MediaQuery.of(context).size.width,
          left: (50 / 821.81) * MediaQuery.of(context).size.height,
          child: FlatButton.icon(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.backspace_rounded,
              color: Colors.blue,
              size: 16.0,
            ),
            label: Text(
              'BACK',
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Colors.grey,
                  fontFamily: 'BNK',
                  fontSize: 16.0),
              textAlign: TextAlign.left,
            ),
          ),
        ),
        Positioned(
            bottom: (30 / 392.72) * MediaQuery.of(context).size.width,
            left: (MediaQuery.of(context).size.height - 180) / 2,
            child: SliderButton(
              action: () {
                ///Do something here OnSlide
                Navigator.popAndPushNamed(context, '/camview');
              },

              ///Put label over here
              label: Text(
                "MAP",
                style: TextStyle(
                    color: Color(0xff4a4a4a),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'BNK',
                    fontSize: 20),
              ),
              icon: Center(
                  child: Icon(
                Icons.camera_alt,
                color: Colors.white,
                size: 30.0,
                semanticLabel: 'Text to announce in accessibility modes',
              )),

              //Put BoxShadow here
              boxShadow: BoxShadow(
                color: Colors.black,
                blurRadius: 4,
              ),

              //Adjust effects such as shimmer and flag vibration here
              // shimmer: true,
              // vibrationFlag: true,

              ///Change All the color and size from here.
              width: 180,
              radius: 50,
              buttonColor: Color(0xff2B3134),
              backgroundColor: Colors.blueAccent,
              highlightedColor: Colors.grey,
              baseColor: Colors.white,
            ))
      ])),
    );
  }

  /////////////////////////////

  Widget build(BuildContext context) {
    return landscape();
  }
}
