import 'package:flutter/material.dart';

import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;

class SensorsHome extends StatelessWidget {
  String? dht, bmp, mq;
  final tempretureChannel =
      IOWebSocketChannel.connect("wss://cmp-rover.herokuapp.com/tempreture");

  final pressureChannel =
      IOWebSocketChannel.connect("wss://cmp-rover.herokuapp.com/pressure");
  final rhChannel = IOWebSocketChannel.connect(
      "wss://cmp-rover.herokuapp.com/relative_humidity");

  final gasChannel =
      IOWebSocketChannel.connect("wss://cmp-rover.herokuapp.com/gas_emission");
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Sensors Output'),
          centerTitle: true,
          backgroundColor: Colors.red[600],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              children: [
                Container(
                  child: Text('DHT'),
                  color: Colors.amber,
                  padding: EdgeInsets.all(20.0),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    StreamBuilder<dynamic>(
                        stream: tempretureChannel.stream,
                        builder: (context, snapshot) {
                          return Text(snapshot.hasData
                              ? ' Reading = ${snapshot.data}'
                              : "Tempreture");
                        }),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  child: Text('Pressure'),
                  color: Colors.amber,
                  padding: EdgeInsets.all(20.0),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    StreamBuilder<dynamic>(
                        stream: pressureChannel.stream,
                        builder: (context, snapshot) {
                          return Text(snapshot.hasData
                              ? ' Reading = ${snapshot.data}'
                              : "Pressure");
                        }),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  child: Text('Relative Humedity'),
                  color: Colors.amber,
                  padding: EdgeInsets.all(20.0),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    StreamBuilder<dynamic>(
                        stream: rhChannel.stream,
                        builder: (context, snapshot) {
                          return Text(snapshot.hasData
                              ? ' Reading = ${snapshot.data}'
                              : "RH");
                        }),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
