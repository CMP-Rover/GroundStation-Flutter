
import 'package:cmp_rover/demo_widgets/DemoSensors.dart';
import 'package:cmp_rover/pages/loading.dart';
import 'package:flutter/material.dart';
import 'package:cmp_rover/pages/mainmenu.dart';
import 'package:cmp_rover/pages/sensordetails.dart';
import 'package:cmp_rover/pages/sensorreadings.dart';
import 'package:cmp_rover/pages/loading.dart';
void main() {
  Paint.enableDithering = true;
  runApp(
      MaterialApp(

        initialRoute: '/',
        routes: {
          '/':(context)=>Loading(),
          '/home':(context)=>MainMenu(),
          '/sensordetails':(context)=>SensorDetail(),
          '/sensorreadings':(context)=>SensorReading(),
        },
      )
  );
}

