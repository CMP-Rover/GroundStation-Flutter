
import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dart:ui' as ui;

//Add this CustomPaint widget to the Widget Tree


class MainMenu extends StatefulWidget {


  @override
  _MainMenuState createState() => _MainMenuState();

}

class _MainMenuState extends State<MainMenu> {
  void initState() {
    // TODO: implement initState


    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

  }
  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CarouselController carouselController = new CarouselController();
    return Scaffold(
        body: Container(
          color: Color(0xff2B3134),

          child:  SafeArea(
            child: Stack(
                children:<Widget>[
                  Positioned(
                    top: 0,
                    right: 0,

                    child:Container(
                      //color: Colors.blueAccent,
                      //height: 50,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xff4092FF),Color(0xff204980)],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        borderRadius:BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                        ),
                        boxShadow: <BoxShadow> [
                          BoxShadow(
                              color: Color(0xffD5CDCD),
                              offset: Offset(-6,0),
                              blurRadius: 12,
                              spreadRadius: -12
                          ),


                        ],),
                      width: MediaQuery.of(context).size.width * 0.42,
                      height: MediaQuery.of(context).size.height * 0.68,

                    ),
                  ),
                  Column(

                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SafeArea(
                          minimum: EdgeInsets.only(left: 15.0,right: 15),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly
                            ,children: [
                            Image(
                              image: AssetImage('assets/logo.png'),
                              width: 70,
                              height: 70,
                            )
                            ,SizedBox(width:MediaQuery.of(context).size.width * (153/375) ,)

                            , ClayContainer(
                              color: Color(0xff2B3134),
                              height: 50,
                              width: 50,
                              borderRadius: 25,
                              spread: 1,
                              //depth: 5,
                              //parentColor: Colors.white,
                              //emboss: true,
                              //child: RaisedButton(onPressed: (){},shape: ,),
                              curveType: CurveType.convex,
                              child: Center(
                                child: FlatButton(
                                  onPressed: (){},
                                  height: 50,
                                  child: Image(image: AssetImage('assets/contact.png'),),
                                  shape: CircleBorder(

                                  ),
                                ),
                              ),

                            ),
                            SizedBox(width:MediaQuery.of(context).size.width * (15/375) ,),
                            ClayContainer(
                              color: Color(0xff2B3134),
                              height: 50,
                              width: 50,
                              borderRadius: 25,
                              spread: 1,

                              //parentColor: Colors.white,
                              //emboss: true,
                              //child: RaisedButton(onPressed: (){},shape: ,),
                              curveType: CurveType.convex,
                              child: Center(
                                child: FlatButton(
                                  onPressed: (){},
                                  height: 50,
                                  child: Image(image: AssetImage('assets/about.png',
                                  ),
                                    width: 10,
                                    height: 20,
                                    alignment: Alignment.center,),
                                  shape: CircleBorder(

                                  ),
                                ),
                              ),
                            ),
                          ],

                          ),
                        ),
                        SizedBox(
                          height: (51.0/812.0)*MediaQuery.of(context).size.height ,
                        ),
                        SafeArea(
                          minimum: EdgeInsets.only(left: 15.0,right: 15),
                          child: Row(

                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Column(
                                    //mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          'Main',
                                          overflow: TextOverflow.ellipsis,

                                          style: TextStyle(fontSize: 45,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Franklin-Gothic',
                                            color: Colors.white,


                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                        Text(
                                          'MENU',
                                          overflow: TextOverflow.visible,
                                          style: TextStyle(
                                            fontSize:40,
                                            //fontWeight: FontWeight.bold,
                                            fontFamily: 'Swis',
                                            color: Colors.white,
                                            height: 0.8,

                                          ),
                                          textAlign: TextAlign.left,
                                        )]),
                                ),
                              ),
                              //new Spacer(),
                              Expanded(
                                flex:2,
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Image(
                                    image: AssetImage('assets/robot.png'),
                                    // width: (220.0/375.0)*MediaQuery.of(context).size.width,
                                    // height: (211.0/812.0)*MediaQuery.of(context).size.height,

                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),
                         Expanded(
                           flex: 5,
                           child: Container(
                            //height: (310.0/812.0)*MediaQuery.of(context).size.height+40,
                            child: CarouselSlider(
                              carouselController: carouselController ,
                              items:<Widget>[
                                OptionCard(icon: '1',title: 0,),
                                OptionCard(icon: '2',title: 1),
                                OptionCard(icon: '3',title: 2),
                                OptionCard(icon: '4',title: 3),
                                OptionCard(icon: '5',title: 4)],
                              //Slider Container properties
                              options: CarouselOptions(
                                  height: (310.0/812.0)*MediaQuery.of(context).size.height,
                                  enlargeCenterPage: true,
                                  viewportFraction: 0.6,
                                  enableInfiniteScroll: false
                              ),
                            ),
                        ),
                         ),
                       // SizedBox(height: 10,),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                            child: ClayContainer(
                              color: Color(0xff2B3134),
                              height: (55.0/812.0)*MediaQuery.of(context).size.height,

                              width: (55.0/812.0)*MediaQuery.of(context).size.height,

                              borderRadius: 30,
                              spread: 8,
                              surfaceColor:Color(0xff0795FF),
                              curveType: CurveType.convex,
                              child: Center(
                                child: FlatButton(

                                  onPressed: (){
                                    exit(0);
                                  },
                                  height: (55.0/812.0)*MediaQuery.of(context).size.height-10,
                                  child: Center(child: Icon(Icons.exit_to_app, color: Colors.white,size: 22.0)),
                                  shape: CircleBorder(

                                  ),

                                ),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(

                        )

                      ]),]
            ),
          ),)
    );
  }
}

class OptionCard extends StatelessWidget {
  final String icon;
  final int title;
  const OptionCard({
    Key ?key,
     required this.icon,
    required this.title

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List <String> titles=['Sensor\nReadings','Robot Arm\nControl','Robot Control','Cam/Map\nView','About'];
    return Container(
      width: (226/375)*MediaQuery.of(context).size.width,
      height: (310.0/812.0)*MediaQuery.of(context).size.height,
      child: Card(
        shadowColor: Colors.black,
        color: Color(0xff2B3134),
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(50),
              topRight: Radius.circular(5),
              topLeft: Radius.circular(50),
              bottomLeft: Radius.circular(5)
          ),

        ),
        child:InkWell(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                Expanded(flex: 3,child: Image(image: AssetImage('assets/$icon.png'),)),
                Expanded(flex:1,child: Text(titles[title],style:
                TextStyle(
                  fontSize: 26.0,
                  fontFamily: 'BNK',
                  //color: Color(0xff0795FF),
                  color: Colors.grey,

                ),textAlign: TextAlign.center,))
              ],
            ),
          ),
          onTap: (){
            if(title==0)
              Navigator.pushNamed(context, '/sensorreadings');
            else if(title==1)
              {

                Navigator.pushNamed(context, '/robotarm');
              }
          },
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(50),
              topRight: Radius.circular(5),
              topLeft: Radius.circular(50),
              bottomLeft: Radius.circular(5)
          ),

        ),

      ),

      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(50),
              topRight: Radius.circular(5),
              topLeft: Radius.circular(50),
              bottomLeft: Radius.circular(5)
          ) ,
          color: Colors.transparent,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Color(0xff717171),
                blurRadius:12,
                spreadRadius: -12,
                offset: Offset(-2, -2)

            ),
            BoxShadow(
                color: Color(0xff2B3134),
                blurRadius: 11,
                spreadRadius: -6,
                offset: Offset(4,2)

            ),

          ]
      ),
    );
  }
}

