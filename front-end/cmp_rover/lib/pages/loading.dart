
import 'package:cmp_rover/pages/mainmenu.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  @override
  void initState() {
    // TODO: implement initState


    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom],);

    //print('initState function ran');
    //Future.delayed(const Duration(seconds: 3), () => "3");
    Timer(
        Duration(seconds: 4),
            () {
              SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
              Navigator.popAndPushNamed(context,'/home')   ;


            });


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xff2B3134),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xff2B3134),Color(0xff2B3134),
                    Color(0xff224067)],
                  //tileMode: TileMode.mirror,
                  begin: Alignment.topCenter,
                  end: Alignment(0.0,1.5)
              )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/logo.png',scale:1.25,),
              SpinKitCircle(
                color: Colors.white70,
                size: 45.0,

              ),
            ],
          ),
        )
    );
  }


}
