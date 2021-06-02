import 'package:flutter/material.dart';
import 'package:control_pad/control_pad.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;

class ControlPadDemo extends StatefulWidget {
  @override
  _ControlPadDemoState createState() => _ControlPadDemoState();
}

class _ControlPadDemoState extends State<ControlPadDemo> {
  final movement =
      IOWebSocketChannel.connect("wss://cmp-rover.herokuapp.com/movement");
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    movement.sink.close(status.goingAway);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Demo Controller"),
        ),
        body: Center(
          child: StreamBuilder(
              stream: movement.stream,
              builder: (context, snapshot) {
                return Column(
                  children: [
                    JoystickView(
                      backgroundColor: Colors.indigo[800],
                      innerCircleColor: Colors.indigo[600],
                      interval: Duration(seconds: 1),
                      showArrows: false,
                      onDirectionChanged: (degrees, distance) {
                        print("Degree = $degrees, and Distance = $distance");
                        if (degrees != 0) movement.sink.add("$degrees");
                      },
                    ),
                    snapshot.hasData ? Text("${snapshot.data}") : Container()
                  ],
                );
              }),
        ),
      ),
    );
  }
}
