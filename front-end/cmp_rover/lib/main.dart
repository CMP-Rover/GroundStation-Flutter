
import 'package:cmp_rover/demo_widgets/DemoSensors.dart';
import 'package:cmp_rover/pages/loading.dart';
import 'package:flutter/material.dart';
import 'package:cmp_rover/pages/mainmenu.dart';
import 'package:cmp_rover/pages/sensordetails.dart';
import 'package:cmp_rover/pages/sensorreadings.dart';
import 'package:cmp_rover/pages/loading.dart';
import 'package:cmp_rover/pages/robotarm_cam_map.dart';
import 'package:flutter/services.dart';
import 'package:cmp_rover/pages/options.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([ DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown]);

  Paint.enableDithering = true;


  return runApp(
      MaterialApp(

        initialRoute: '/',
        routes: {
          '/':(context)=>Loading(),
          '/home':(context)=>MainMenu(),
          '/sensordetails':(context)=>SensorDetail(),
          '/sensorreadings':(context)=>Options(index: 1),
          '/robotarm':(context)=>Options(index: 0),

        },
      )
  );
}

