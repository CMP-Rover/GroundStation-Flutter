import 'package:flutter/material.dart';
import 'package:control_pad/control_pad.dart';

class ControlPadDemo extends StatefulWidget {
  @override
  _ControlPadDemoState createState() => _ControlPadDemoState();
}

class _ControlPadDemoState extends State<ControlPadDemo> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Demo Controller"),
        ),
        body: Center(
          child: JoystickView(
            onDirectionChanged: (degrees, distance) {
              print("Degree = $degrees, and Distance = $distance");
            },
          ),
        ),
      ),
    );
  }
}
