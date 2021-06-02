import 'dart:io';
import 'package:cmp_rover/pages/mainmenu.dart';
import 'package:cmp_rover/pages/robotarm_cam_map.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:control_pad/control_pad.dart';
import 'package:control_button/control_button.dart';
import 'package:cmp_rover/pages/sensordetails.dart';
import 'package:cmp_rover/pages/sensorreadings.dart';
class Options extends StatefulWidget {
  final int index;
  const Options({Key? key,
  this.index = 1}) : super(key: key);

  @override
  _OptionsState createState() => _OptionsState();
}

class _OptionsState extends State<Options> {
  int selectedpage=0; //initial value

  final _pageOptions = [Robot_Arm(), SensorReading()]; // listing of all 3 pages index wise
  void initState() {
    super.initState();
    selectedpage=widget.index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: CurvedNavigationBar(
        color: Color(0xff26282B),
        buttonBackgroundColor: Colors.blue,
        index: widget.index,
        height: 75.0,
        backgroundColor: Colors.blueAccent,
        items: <Widget>[
          Icon(Icons.camera_alt,size: 30.0,color: Colors.blueAccent,),
          Icon(Icons.videogame_asset_rounded,size: 30.0,color: Colors.blueAccent,),
          Icon(Icons.network_check_rounded,color: Colors.white,size: 30.0,),
          Icon(Icons.location_on, size: 30.0,color: Colors.blueAccent,),
          Icon(Icons.info_outlined,size: 30.0,color: Colors.blueAccent,)
        ],
        onTap: (index) { setState(() {
    selectedpage = index;  // changing selected page as per bar index selected by the user
    });}
      ),

      body:_pageOptions[selectedpage],

    );
  }
}
