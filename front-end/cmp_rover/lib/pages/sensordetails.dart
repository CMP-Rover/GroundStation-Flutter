import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as math;
import 'package:cmp_rover/pages/sensorreadings.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class SensorDetail extends StatelessWidget {
  final  url;
  SensorDetail({this.url});
  @override
  Widget build(BuildContext context) {
    return Circular_arc();

  }
}

final Gradient gradient = new LinearGradient(
  colors: <Color>[
    Color(0xff005C97).withOpacity(1.0),
    // Color(0xff4364f7).withOpacity(1.0),
    Color(0xff363795).withOpacity(1.0),


    //   Colors.white70.withOpacity(1.0),
  ],
  stops: [
    0.0,
    // 0.5,
    1.0,
  ],
);

class Circular_arc extends StatefulWidget {
  const Circular_arc({
     Key? key,
  }) : super(key: key);
  final double goalCompleted = 1;
  @override
  _Circular_arcState createState() => _Circular_arcState();
}

class _Circular_arcState extends State<Circular_arc> with TickerProviderStateMixin {
  late AnimationController _radialProgressAnimationController;
  late Animation<double> _progressAnimation;
  final Duration fadeInDuration = Duration(milliseconds: 500);
  final Duration fillDuration = Duration(seconds: 8);

  double progressDegrees = 0;
  var count = 0;
  late AnimationController _controller;
  late Animation<double> animation;
  @override
  void initState() {
    super.initState();
    _radialProgressAnimationController =
        AnimationController(vsync: this, duration: fillDuration);
    _controller = AnimationController(

      duration: const Duration(minutes: 1),
      vsync: this,
    )..repeat(reverse: false);
    animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,);
    _progressAnimation = Tween(begin: 0.0, end: 360.0).animate(CurvedAnimation(
        parent: _radialProgressAnimationController, curve: Curves.easeInToLinear))
      ..addListener(() {
        setState(() {
          progressDegrees = widget.goalCompleted * _progressAnimation.value;

        });
      });
    // _radialProgressAnimationController.repeat(reverse: true);
    //_radialProgressAnimationController.forward();
    _radialProgressAnimationController.forward( );

  }

  @override
  void dispose() {
    _radialProgressAnimationController.dispose();
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Color(0xff2B3134),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xff2B3134),Color(0xff2B3134),
                  Color(0xff224067)],
                //tileMode: TileMode.mirror,
                begin: Alignment.topCenter,
                end: Alignment(0.0,1.5)),
          ),
          child: Stack(

            children: [
              Positioned(
                top: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Column(

                      children: [
                        Header(),
                        SizedBox(
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
                        Align(
                          alignment: Alignment.topCenter,
                          child: Text('Sensor Details',style: TextStyle(color: Colors.white,
                              fontSize: 28, fontFamily: 'BNK'),
                            textAlign: TextAlign.start,),
                        ),

                      ],
                    ),
                  )),
              Positioned(
                left:(MediaQuery.of(context).size.width-220)/2,
                top:(155/821.81)*MediaQuery.of(context).size.height,
                child: CustomPaint(

                  child: Container(
                    height: (220.0/821.81)*MediaQuery.of(context).size.height,
                    width: (220.0/821.81)*MediaQuery.of(context).size.height,
                    padding: EdgeInsets.symmetric(vertical: 40.0),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: <Color>[
                          Color(0xff2B3134),
                          Color(0xff616364)
                        ],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight
                        ),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Colors.blueAccent,
                              blurRadius: 35,
                              spreadRadius: -5
                          )
                        ],
                        image: DecorationImage(image:AssetImage('assets/circle.png'),fit:BoxFit.fill ),
                        shape: BoxShape.circle
                    ),
                    child: Center(
                      child: Column(

                        children: <Widget>[
                          SizedBox(
                            height: 4.0,
                          ),
                          Text(
                            'Reading',
                            style: TextStyle(fontSize: 21.0, letterSpacing: 1.5, color: Colors.white70),
                          ),
                          SizedBox(
                            height: 4.0,
                          ),
                          Container(
                            height: 5.0,
                            width: 80.0,
                            decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                borderRadius: BorderRadius.all(Radius.circular(4.0))),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            '1.225',
                            style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold,color: Colors.white70),
                          ),
                          Text(
                            'Unit',
                            style: TextStyle(
                                fontSize: 21.0, color: Colors.blue, letterSpacing: 1.5),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //  painter: RadialPainter(progressDegrees),
                ),
              ),
              Positioned(
                  left:(MediaQuery.of(context).size.width-290)/2,
                  top:(130/821.81)*MediaQuery.of(context).size.height,
                  child: RotationTransition(
                    turns: animation,
                    child: Image(image:AssetImage('assets/circle2.png'),height: 290.0,
                      width:290.0,),
                  )),
              Positioned(
                bottom: (70/821.81)*MediaQuery.of(context).size.height,
                left:(MediaQuery.of(context).size.width-((280/375)*MediaQuery.of(context).size.width))/2,
                child: Container(
                    width: (280/375)*MediaQuery.of(context).size.width,
                    height: (280/812.0)*MediaQuery.of(context).size.height,
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(

                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(5),
                          topRight: Radius.circular(5),
                          topLeft: Radius.circular(5),
                          bottomLeft: Radius.circular(5)
                      ),
                      border: Border.all(
                        color: Colors.blue,
                        width: 1.5
                      ),
                        gradient: LinearGradient(colors: <Color>[
                          Color(0xff2B3134),
                          Color(0xff616364)
                        ],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight
                        ),
                        //color:Colors.white70
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          flex:3,
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Image(image: AssetImage(
                                      'assets/dht.png'
                                  )),
                                ),

                              ),
                              Expanded(

                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex:2,
                                      child: Text('Sensor Name:', textAlign: TextAlign.left,style: TextStyle(
                                        color: Colors.white,fontFamily: 'BNK'
                                      ),),
                                    ), 
                                    Expanded(
                                      flex: 3,
                                      child: Text('DHT', textAlign: TextAlign.left,style: TextStyle(
                                       color: Colors.blueAccent,
                                        fontWeight: FontWeight.bold
                                      ),),
                                    ),
                                     Expanded(
                                       flex:2,
                                       child: Text('Readings:', textAlign: TextAlign.left,style: TextStyle(
                                       color: Colors.white,fontFamily: 'BNK'
                                    ),),
                                     ), 
                                    Expanded(
                                      flex:3,
                                      child: Text('Temperature ,', textAlign: TextAlign.left,style: TextStyle(

                                          fontWeight: FontWeight.bold, color: Colors.blueAccent,
                                      ),),
                                    ),
                                    Expanded(
                                      flex:3,
                                      child: Text('Pressure', textAlign: TextAlign.left,style: TextStyle(

                                        fontWeight: FontWeight.bold, color: Colors.blueAccent,
                                      ),),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ), 
                        SizedBox(
                          height: 0.5,
                          child: Container(
                            color: Colors.blue,

                            // width: 100.0,
                          ),
                        ),

                        Expanded(
                          flex: 2,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                flex: 2,
                                child: Text('Temperature:', textAlign: TextAlign.left,style: TextStyle(
                                   color: Colors.white,fontFamily: 'BNK'
                                ),),
                              ), 
                              Expanded(
                                flex: 3,
                                child: Text('Temp of the room bla bla bla blaaa blaaa, max 25', textAlign: TextAlign.left,overflow:TextOverflow.clip,style: TextStyle(

                                 color: Colors.blueAccent,
                                ),),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 0.5,
                          child: Container(
                            color: Colors.blue,

                           // width: 100.0,
                          ),
                        ),

                         Expanded(
                           flex: 2,
                           child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,

                            children: <Widget>[
                              Expanded(
                                flex: 2,
                                child: Text('Pressure:', textAlign: TextAlign.left,style: TextStyle(
                                    color: Colors.white,fontFamily: 'BNK'
                                ),),
                              ),
                              Expanded(
                                flex: 3,
                                child: Text('Temp of the room ay haga w ay habal ana mesh fahma haga , max 25', textAlign: TextAlign.left,overflow:TextOverflow.clip,style: TextStyle(

                                  color: Colors.blueAccent,
                                ),),
                              ),
                            ],
                        ),
                         )
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class RadialPainter extends CustomPainter {
  double progressInDegrees;

  RadialPainter(this.progressInDegrees);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Color(0xff454748)
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke

      ..strokeWidth = 10;


    Offset center = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(center, (size.width+25)/ 2, paint);

    Paint progressPaint = Paint()
      ..shader = gradient
          .createShader(Rect.fromCircle(center: center, radius: size.width/ 2))
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth =10;

    canvas.drawArc(
        Rect.fromCircle(center: center, radius: (size.width+25)/ 2),
        math.radians(-90),
        math.radians(progressInDegrees),
        false,
        progressPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}