import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:control_pad/control_pad.dart';
import 'package:control_button/control_button.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyHome(),
        routes: <String,WidgetBuilder>{
          '/RobotArm':(context)=>Robot_Arm(),'/home':(context)=>MyHome(),'/CemeraView':(context)=>Camera_View(),'/MapView':(context)=>  Map_View()
        }
    );
  }
}




class MyHome extends StatefulWidget {
  _MyHome createState() => _MyHome();
}

class _MyHome extends State<MyHome> {
  @override


  @override
  Widget build(BuildContext context)
  {
    return Scaffold(


        appBar: AppBar(elevation: 0 ,
          backgroundColor: Colors.white,


        ),
        body:Center(


            child:Column(children: <Widget>[FlatButton(color:Colors.blueAccent,onPressed:(){Navigator.pushNamed(context, '/RobotArm');} , child: Text('Robot Arm'))



            ],)

        )
    );

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




class Robot_Arm extends StatefulWidget
{

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
    String text='';
    void updateState(String showText) {
      setState(() {
        text = showText;
      });}
    double size=MediaQuery.of(context).size.width;
    return    SafeArea(
        child: RotatedBox(
          quarterTurns: 1,
          child: Container(
            decoration: BoxDecoration(

              gradient: LinearGradient(colors: <Color>[

                Color(0xff616364),
                Color(0xff2B3134),
              ],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight
              ),
            ),
              child: Stack(children: [



            Positioned(top:(20/392.72)*MediaQuery.of(context).size.width,left:(50/821.81)*MediaQuery.of(context).size.height,child: FlatButton.icon(

              onPressed: (){
                Navigator.pop(context);
              }, icon: Icon(Icons.backspace_rounded,color: Colors.blue,size: 16.0,),
              label: Text('BACK',style: TextStyle(decoration: TextDecoration.underline,color: Colors.grey,fontFamily: 'BNK',fontSize: 16.0),textAlign: TextAlign.left,),
            ),),


            Positioned(top:(30/392.72)*MediaQuery.of(context).size.width,right:(MediaQuery.of(context).size.height-(375))/2,
                child:Container(child: Text("Robot Arm Control",style: TextStyle(color: Colors.white,fontSize: 28,fontFamily: 'BNK'),),)
            ),
            Positioned( bottom: (80/392.72)*MediaQuery.of(context).size.width,right: (70/821.82)*MediaQuery.of(context).size.height,
              child:Container(child:
              ClayContainer(color: Color(0xff41474A),height: 55, width: 55,borderRadius: 30, spread: 1, curveType: CurveType.none,
                child: Center(child: FlatButton(onPressed: (){}, height: 55, child:Icon(Icons.arrow_forward_rounded,color: Colors.blueAccent,), shape: CircleBorder(),),),
                ),),
            ) //right
            ,Positioned( bottom: (80/392.72)*MediaQuery.of(context).size.width,right: (170/821.82)*MediaQuery.of(context).size.height, child:Container( child:
                ClayContainer(color: Color(0xff41474A),height: 55, width: 55,borderRadius: 30, spread: 1, curveType: CurveType.none,
                  child: Center(child: FlatButton(onPressed: (){}, height: 55, child:Icon(Icons.arrow_back_rounded,color: Colors.blueAccent,), shape: CircleBorder(),),),
                ),
                ),  ), //left
            Positioned( bottom: (30/392.72)*MediaQuery.of(context).size.width,right: (120/821.82)*MediaQuery.of(context).size.height, child:Container( child:
            ClayContainer(color: Color(0xff41474A),height: 55, width: 55,borderRadius: 30, spread: 1, curveType: CurveType.none,
              child: Center(child: FlatButton(onPressed: (){}, height: 55, child:Icon(Icons.arrow_downward_rounded,color: Colors.blueAccent,), shape: CircleBorder(),),),
            ),
            ),  ), //down
            Positioned( bottom: (130/392.72)*MediaQuery.of(context).size.width,right: (120/821.82)*MediaQuery.of(context).size.height, child:Container( child:
            ClayContainer(color: Color(0xff41474A),height: 55, width: 55,borderRadius: 30, spread: 1, curveType: CurveType.none,
              child: Center(child: FlatButton(onPressed: (){}, height: 55, child:Icon(Icons.arrow_upward_outlined,color: Colors.blueAccent,), shape: CircleBorder(),),),
            ),            ),  )
            ,Positioned( bottom: (270/392.72)*MediaQuery.of(context).size.width,right: (60/821.82)*MediaQuery.of(context).size.height, child:Container( child:RaisedButton(onPressed: (){},child: Icon(Icons.arrow_forward,color: Colors.blueAccent,),color: Color(0xff41474A))),  )
            ,Positioned( bottom: (270/392.72)*MediaQuery.of(context).size.width,right:  (180/821.82)*MediaQuery.of(context).size.height, child:Container( child:RaisedButton(onPressed: (){},child: Icon(Icons.arrow_back,color: Colors.blueAccent,),color:  Color(0xff41474A))), ),
            Positioned( bottom: (30/392.72)*MediaQuery.of(context).size.width,left:  (60/821.82)*MediaQuery.of(context).size.height, child:Container( child:JoystickView(size: 150,showArrows: false,)), ),
            Positioned(top:30,right:  (210/821.82)*MediaQuery.of(context).size.height,child: Image(image: AssetImage('assets/arm.png'),height: 420,width: 420,)) ,



              ])),
        ),

      );
  }

  Widget build(BuildContext context) {
    return landscape();
  }


}


class Camera_View extends StatefulWidget
{

  _Camera_View createState() => _Camera_View();


}
class _Camera_View extends State<Camera_View> {


  @override



  //////////////////////////////////////////////////////////////////////bottom bar///////////////////////////////

  Widget Nav_Bar2()


  {
    return Positioned(right: 0,top:10,child: Container(width: 70,height: 500,decoration: BoxDecoration(boxShadow: [BoxShadow(color: Color(0xff26282B),blurRadius: 5,)]),));



  }

  Widget bottom_bar_cemera()


  {
    final Size size = MediaQuery.of(context).size;

    return Container (





      child:Stack(



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
                      child: Icon(Icons.photo_camera_outlined ),
                      elevation: 0.1,
                    ),
                  ),
                  Container(
                    width: size.width ,
                    height: 80,child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(icon: Icon(Icons.home,color: Colors.blueAccent,), onPressed: (){}),
                      IconButton(icon: Icon(Icons.settings_input_component,color: Colors.blueAccent,), onPressed: (){}),
                      Container(width: size.width*0.20,),
                      IconButton(icon: Icon(Icons.games_sharp,color: Colors.blueAccent,), onPressed: (){Navigator.pushNamed(context, '/RobotArm');}),
                      IconButton(icon: Icon(Icons.map_sharp,color: Colors.blueAccent,), onPressed: (){Navigator.pushNamed(context, '/MapView');}),

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
  Widget nav_bar_cemera()


  {
    final Size size = MediaQuery.of(context).size;

    return Container (





      child:Stack(



        children: [





          Positioned(

            bottom: 0,
            left: 0,

            child: Container(
              color: Colors.black,
              width: size.width,
              height: 40,
              child: Stack(
                children: [

                  Center(
                    heightFactor: 1.5,
                    child: FloatingActionButton(
                      onPressed: () {},
                      backgroundColor: Colors.blueAccent,
                      child: Icon(Icons.photo_camera_outlined ),
                      elevation: 0.1,
                    ),
                  ),
                  Container(
                    width: size.width ,
                    height: 80,child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(icon: Icon(Icons.home,color: Colors.blueAccent,), onPressed: (){}),
                      IconButton(icon: Icon(Icons.settings_input_component,color: Colors.blueAccent,), onPressed: (){}),
                      Container(width: size.width*0.20,),
                      IconButton(icon: Icon(Icons.games_sharp,color: Colors.blueAccent,), onPressed: (){Navigator.pushNamed(context, '/RobotArm');}),
                      IconButton(icon: Icon(Icons.map_sharp,color: Colors.blueAccent,), onPressed: (){Navigator.pushNamed(context, '/MapView');}),

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

  /////////////////////////////////////////////////////////////////////////////////////////////////////////

/////portier//////////

  Widget portier() {

    return Container(child: Stack(children: [ bottom_bar_cemera(),Positioned(bottom: 500,right: 230,child:  RaisedButton(padding: EdgeInsets.symmetric(vertical: 16,horizontal: 60),shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),onPressed:(){Navigator.pushNamed(context, '/MapView');},color: Colors.blueAccent,child: Text("MAP",style: TextStyle(color: Colors.white,fontSize: 23),),),),
      Positioned(bottom: 500,right: 230,child: FloatingActionButton(heroTag: 'next2',onPressed: (){},child: Icon(Icons.photo_camera,color: Colors.blueAccent,),backgroundColor: Color(0xff41474A)),)]));



  }

  Widget landscape() {

    return Container(child: Stack(children: [Nav_Bar2(),

      Positioned(top:20,right:670,child: IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.blue),onPressed:(){Navigator.pushNamed(context, '/home');} ,),),
      Positioned(bottom:300,right:5,child: Container(child: IconButton(icon: Icon(Icons.map_sharp,color: Colors.blueAccent,),onPressed: (){Navigator.pushNamed(context, '/MapView');},),),),Positioned(bottom:230,right:5,child: Container(child: IconButton(icon: Icon(Icons.games,color: Colors.blueAccent,),onPressed: (){Navigator.pushNamed(context, '/RobotArm');},),),),
      Positioned(bottom:95,right:5,child:  Container(child: IconButton(icon: Icon(Icons.camera,color: Colors.blueAccent,),onPressed: (){},),)),
      Positioned(top:35,right:640,child: Container(child: Text("BACK",style: TextStyle(color: Colors.white,decoration: TextDecoration.underline),),),),
      Positioned(bottom:25,right:5,child:Container(child: IconButton(icon: Icon(Icons.home,color: Colors.blueAccent,),onPressed: (){},),)),
      Positioned(bottom:150,right:20,child:Container(child: FloatingActionButton(heroTag: 'next7',onPressed: (){},child: Icon(Icons.photo_camera,color: Colors.white,),backgroundColor: Colors.blueAccent ),)),

      Positioned(bottom: 30,right: 270,child:  RaisedButton(padding: EdgeInsets.symmetric(vertical: 16,horizontal: 60),shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),onPressed:(){},color: Colors.blueAccent,child: Text("CAMERA",style: TextStyle(color: Colors.white,fontSize: 23),),)),

      Positioned(bottom: 32,right: 430,child: FloatingActionButton(heroTag: 'next2',onPressed: (){Navigator.pushNamed(context, '/MapView');},child: Icon(Icons.map_sharp,color: Colors.white,),backgroundColor: Color(0xff41474A)),)

    ]));



  }

  ///////////////////

  //Positioned(bottom: 30,right: 270,child:  RaisedButton(padding: EdgeInsets.symmetric(vertical: 16,horizontal: 60),shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),onPressed:(){Navigator.pushNamed(context, '/MapView');},color: Colors.blueAccent,child: Text("MAP",style: TextStyle(color: Colors.white,fontSize: 23),),),)
//Positioned(bottom: 32,right: 250,child: FloatingActionButton(heroTag: 'next8',onPressed: (){},child: Icon(Icons.photo_camera,color: Colors.blueAccent,),backgroundColor: Color(0xff41474A)),),
  ///////////////////



  /////////////////////////////

  Widget build(BuildContext context) {


    return Scaffold(
      /*appBar: AppBar(
          backgroundColor: Color(0xff41474A),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.blue,
            ),
            onPressed: (){Navigator.pushNamed(context, '/home');} ,
          ),

          centerTitle: true,
          elevation: 0,
        ),*/
        backgroundColor: Color(0xff41474A),
        body:OrientationBuilder(
          builder: (context, orientation) {
            if (orientation == Orientation.portrait) {
              return portier();
            } else {
              return landscape();
            }
          },
        )
    );
  }





}

class Map_View extends StatefulWidget
{

  _Map_View createState() => _Map_View();


}


class _Map_View extends State<Map_View> {


  @override


  //////////////////////////////////////////////////////////////////////bottom bar///////////////////////////////
  Widget bottom_bar_Map()


  {
    final Size size = MediaQuery.of(context).size;

    return Container (





      child:Stack(



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
                      child: Icon(Icons.map_sharp ),
                      elevation: 0.1,
                    ),
                  ),
                  Container(
                    width: size.width ,
                    height: 80,child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(icon: Icon(Icons.home,color: Colors.blueAccent,), onPressed: (){}),
                      IconButton(icon: Icon(Icons.settings_input_component,color: Colors.blueAccent,), onPressed: (){}),
                      Container(width: size.width*0.20,),
                      IconButton(icon: Icon(Icons.games_sharp,color: Colors.blueAccent,), onPressed: (){Navigator.pushNamed(context, '/RobotArm');}),
                      IconButton(icon: Icon(Icons.photo_camera_outlined ,color: Colors.blueAccent,), onPressed: (){Navigator.pushNamed(context, '/CemeraView');}),

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
  Widget Nav_Bar2()


  {
    return Positioned(right: 0,top:10,child: Container(width: 70,height: 500,decoration: BoxDecoration(boxShadow: [BoxShadow(color: Color(0xff26282B),blurRadius: 5,)]),));



  }

  /////////////////////////////////////////////////////////////////////////////////////////////////////////
  Widget nav_bar_Map()


  {
    final Size size = MediaQuery.of(context).size;

    return Container (





      child:Stack(



        children: [





          Positioned(

            bottom: 0,
            left: 0,

            child: Container(
              color: Colors.black,
              width: size.width,
              height: 40,
              child: Stack(
                children: [

                  Center(
                    heightFactor: 1.5,
                    child: FloatingActionButton(
                      onPressed: () {},
                      backgroundColor: Colors.blueAccent,
                      child: Icon(Icons.map_sharp ),
                      elevation: 0.1,
                    ),
                  ),
                  Container(
                    width: size.width ,
                    height: 80,child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(icon: Icon(Icons.home,color: Colors.blueAccent,), onPressed: (){}),
                      IconButton(icon: Icon(Icons.settings_input_component,color: Colors.blueAccent,), onPressed: (){}),
                      Container(width: size.width*0.20,),
                      IconButton(icon: Icon(Icons.games_sharp,color: Colors.blueAccent,), onPressed: (){Navigator.pushNamed(context, '/RobotArm');}),
                      IconButton(icon: Icon(Icons.photo_camera_outlined ,color: Colors.blueAccent,), onPressed: (){Navigator.pushNamed(context, '/CemeraView');}),

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
/////portier//////////

  Widget portier() {

    return Container(child: Stack(children: [ bottom_bar_Map(),Positioned(bottom: 500,right: 230,child:  RaisedButton(padding: EdgeInsets.symmetric(vertical: 16,horizontal: 60),shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),onPressed:(){Navigator.pushNamed(context, '/MapView');},color: Colors.blueAccent,child: Text("CAMERA",style: TextStyle(color: Colors.white,fontSize: 23),),),),
      Positioned(bottom: 500,right: 230,child: FloatingActionButton(heroTag: 'next2',onPressed: (){},child: Icon(Icons.map_sharp,color: Colors.blueAccent,),backgroundColor: Color(0xff41474A)),)]));








  }
  Widget landscape() {

    return Container(child: Stack(children: [Nav_Bar2(),


      Positioned(bottom:200,right:20,child: Container(child: FloatingActionButton(onPressed: (){},child: Icon(Icons.map_sharp,color: Colors.white,),backgroundColor: Colors.blueAccent,),),)
      ,Positioned(top:35,right:640,child: Container(child: Text("BACK",style: TextStyle(color: Colors.white,decoration: TextDecoration.underline),),),)
      ,Positioned(top:20,right:670,child: IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.blue),onPressed:(){Navigator.pushNamed(context, '/home');} ,),)
      , Positioned(bottom: 30,right: 270,child:  RaisedButton(padding: EdgeInsets.symmetric(vertical: 16,horizontal: 60),shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),onPressed:(){},color: Colors.blueAccent,child: Text("MAP",style: TextStyle(color: Colors.white,fontSize: 23),),),),
      Positioned(bottom: 32,right: 260,child: FloatingActionButton(heroTag: 'next8',onPressed: (){Navigator.pushNamed(context, '/CemeraView');},child: Icon(Icons.photo_camera,color: Colors.white,),backgroundColor: Color(0xff41474A)),),
      Positioned(bottom:300,right:5,child:  Container(child: IconButton(icon: Icon(Icons.games,color: Colors.blueAccent,),onPressed: (){Navigator.pushNamed(context, '/RobotArm');},),)),
      Positioned(bottom:95,right:5,child:  Container(child: IconButton(icon: Icon(Icons.camera,color: Colors.blueAccent,),onPressed: (){},),)),
      Positioned(bottom:25,right:5,child:  Container(child: IconButton(icon: Icon(Icons.home,color: Colors.blueAccent,),onPressed: (){},),))

    ]));



  }



  /////////////////////////////

  Widget build(BuildContext context) {


    return Scaffold(
      /* appBar: AppBar(
          backgroundColor: Color(0xff41474A),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.blue,
            ),
            onPressed: (){Navigator.pushNamed(context, '/home');} ,
          ),

          centerTitle: true,
          elevation: 0,
        ),*/
        backgroundColor: Color(0xff41474A),
        body:OrientationBuilder(
          builder: (context, orientation) {
            if (orientation == Orientation.portrait) {
              return portier();
            } else {
              return landscape();
            }
          },
        )
    );
  }





}


