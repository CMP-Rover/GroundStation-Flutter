import 'package:flutter/material.dart';
import 'package:control_pad/control_pad.dart';
import 'package:web_socket_channel/io.dart';

class ControlPadDemo extends StatefulWidget {
  @override
  _ControlPadDemoState createState() => _ControlPadDemoState();
}

class _ControlPadDemoState extends State<ControlPadDemo> {
  final tempretureChannel =
      IOWebSocketChannel.connect("wss://cmp-rover.herokuapp.com/tempreture");
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
