
import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'dart:ui' as ui;

import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;

//Add this CustomPaint widget to the Widget Tree


class SensorReading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomePage();

  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return  Container(
          color: Color(0xff2B3134),

          child:  SafeArea(

            child: Stack(
                children:<Widget>[
                  Positioned(
                    bottom: 10,
                    right: 0,
                    child:SensorReadingContainer(
                      color: Color(0xff132641),
                      shadowcolor:Color(0xff000000),
                      sensorId: 3,),
                  ),

                  Positioned(
                    bottom:(MediaQuery.of(context).size.height-(MediaQuery.of(context).size.height*(165/812.0)+85))/4, //+MediaQuery.of(context).padding.top
                    right: 0,
                    child:SensorReadingContainer(
                      color: Color(0xff4092FF),
                      shadowcolor:Color(0xff2C5B9E),
                      sensorId: 2 ,),
                  ),
                  Positioned(
                    bottom: 2*(MediaQuery.of(context).size.height-(MediaQuery.of(context).size.height*(165/812.0)+85))/4,
                    right: 0,
                    child:SensorReadingContainer(
                        color: Color(0xff154C94),
                        shadowcolor:Color(0xff97BDEF),
                        sensorId: 1),
                  ),
                  Positioned(
                    bottom: 3*(MediaQuery.of(context).size.height-(MediaQuery.of(context).size.height*(165/812.0)+85))/4,
                    right: 0,
                    child:SensorReadingContainer(
                        color: Color(0xff89A4C6),
                        shadowcolor:Color(0xff6BA6F5) ,
                        sensorId: 0),
                  ),

                  Positioned(
                    top: 0.0,
                    left: 0.0,
                    right: 0.0,

                    child:Container(

                      //color: Colors.blueAccent,
                      //height: 50,
                      decoration: BoxDecoration(
                        color: Color(0xff2B3134),
                        borderRadius:BorderRadius.only(
                          bottomLeft: Radius.circular(80),
                        ),
                        boxShadow: <BoxShadow> [
                          BoxShadow(
                              color: Color(0xffD5CDCD),
                              offset: Offset(-6,0),
                              blurRadius: 12,
                              spreadRadius: -12
                          ),


                        ],),
                      width: MediaQuery.of(context).size.width ,
                      height: MediaQuery.of(context).size.height*(165/812.0), //(MediaQuery.of(context).size.height-(MediaQuery.of(context).size.height*(165/812.0)+75))/4
                      child:Column(
                        children: [
                          Expanded(flex:2,child: Align(alignment: Alignment.topCenter,child: Header())),
                           Expanded(
                             flex:1, child: SizedBox(
                             height: 20.0,
                             child: Align(
                               alignment: Alignment.topLeft,
                               child: FlatButton.icon(

                                 onPressed: (){
                                   Navigator.pop(context);
                                 }, icon: Icon(Icons.backspace_rounded,color: Colors.blue,size: 12.0,),
                                 label: Text('Back',style: TextStyle(decoration: TextDecoration.underline,color: Colors.grey),textAlign: TextAlign.left,),
                               ),
                             ),
                           ),
                           ),
                          Expanded(
                            flex: 2,
                            child: Text('Sensor Readings',style: TextStyle(color: Colors.white,
                                fontSize: 28, fontFamily: 'BNK'),
                              textAlign: TextAlign.center,),
                          )
                        ],
                      ) ,

                    ),
                  ),
                ]
            ),
          ),);
  }
}

class SensorReadingContainer extends StatelessWidget {
  final bmpChannel =
  IOWebSocketChannel.connect("wss://cmp-rover.herokuapp.com/tempreture");

  final mq7Channel =
  IOWebSocketChannel.connect("wss://cmp-rover.herokuapp.com/pressure");

  final dhtChannel = IOWebSocketChannel.connect(
      "wss://cmp-rover.herokuapp.com/relative_humidity");

  final mq2Channel =
  IOWebSocketChannel.connect("wss://cmp-rover.herokuapp.com/gas_emission");

  final Color color ;
  final Color shadowcolor;
  final int sensorId; //from 0 =>3, 0 is bmp, 1 is dht , 2 mq2, 3 is mq7

  SensorReadingContainer({
    Key? key,
    required this.color
    ,required this.shadowcolor,
    required this.sensorId
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius:BorderRadius.only(
            bottomLeft: Radius.circular(80),
          ),
          boxShadow: <BoxShadow> [
            BoxShadow(
                color: shadowcolor,
                offset: Offset(-2,12),
                blurRadius:5,
                spreadRadius: 2
            ),
          ],),
        width: MediaQuery.of(context).size.width ,
        height: MediaQuery.of(context).size.height*(120/812.0)+80,
        child:Column(
          children: [
            Expanded(
              child: SizedBox(
                height: (MediaQuery.of(context).size.height*(156/812.0)+70)/2,
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0,8,20.0,0.0),
                child: Row(

                  children: [
                    Expanded(child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image(image:(sensorId==0)? AssetImage('assets/bmp.png'):(sensorId==1)? AssetImage('assets/dht.png')
                          :(sensorId==2)? AssetImage('assets/mq2.png'):AssetImage('assets/mq7.png')),
                    )),
                    Expanded(child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text((sensorId==0)?'BMP':(sensorId==1)?'DHT':(sensorId==2)?'MQ2':'MQ7',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            fontSize: 40,
                            color: Colors.white,
                            fontFamily:'Raleway',),textAlign: TextAlign.center, ),
                        SizedBox(height: 10,),
                        StreamBuilder<dynamic>(
                            stream: (sensorId==0)?bmpChannel.stream:(sensorId==1)?dhtChannel.stream:(sensorId==2)?mq2Channel.stream:mq7Channel.stream,
                            builder: (context, snapshot) {
                              return Text((snapshot.data == null)
                                  ? 'reading'
                                  :(snapshot.data == 'Connected Successfully')? '':'R=${snapshot.data}',
                                  style: TextStyle(fontSize: 28, color: Colors.white70,fontWeight: FontWeight.bold,),textAlign: TextAlign.center );
                            }),
                      ],
                    )),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(child: SizedBox(width: 20.0,)),
                          Expanded(child: ClayContainer(
                            color: Color(0xff2B3134),
                            height: 50,
                            width: 50,
                            borderRadius: 10,
                            spread: 0.5,
                            emboss: true,
                            //child: RaisedButton(onPressed: (){},shape: ,),
                            curveType: CurveType.convex,
                            child: Center(
                              child: FlatButton(
                                onPressed: (){
                                  Navigator.pushNamed(context, '/sensordetails');
                                },
                                height: 50,

                                child: Icon(Icons.arrow_forward_ios_outlined,color: Colors.blueAccent,),


                              ),
                            ),
                          ),),
                        ],
                      ),
                    ),
                    // ignore: deprecated_member_use

                  ],
                ),
              ),
            ),
          ],
        )


    );
  }
}

class Header extends StatelessWidget {
  const Header({
    Key ?key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
    );
  }
}

