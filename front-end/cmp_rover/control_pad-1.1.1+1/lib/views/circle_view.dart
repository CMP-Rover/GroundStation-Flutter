import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CircleView extends StatelessWidget {
  final double size;

  final Color color;

  final List<BoxShadow> boxShadow;

  final Border border;

  final double opacity;

  final Image buttonImage;

  final Icon buttonIcon;

  final String buttonText;
  bool inner;
  CircleView({
    this.size,
    this.color = Colors.transparent,
    this.boxShadow,
    this.border,
    this.opacity,
    this.buttonImage,
    this.buttonIcon,
    this.buttonText,
    this.inner = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      child: Center(
        child: buttonIcon != null
            ? buttonIcon
            : (buttonImage != null)
                ? buttonImage
                : (buttonText != null) ? Text(buttonText) : null,
      ),
      decoration: BoxDecoration(

        gradient:(!inner)? LinearGradient(
          colors: [Color(0xff595D60),Color(0xff2B3134)],
          begin: Alignment.topRight,

          end: Alignment.bottomLeft,

        ):LinearGradient(
            colors: [Color(0xff56A7E6),Color(0xff1367F5)],
          begin: Alignment.topLeft,

          end: Alignment.bottomRight,
        ),
        //color: inner? color : null,
        shape: BoxShape.circle,
        border: border,

        boxShadow: boxShadow,
      ),
    );
  }

  factory CircleView.joystickCircle(double size, Color color) => CircleView(
        size: size,
        inner: false,
        color: Color(0xff717577),
        border: Border.all(
          color: Color(0xff4092FF),
          width: 2.0,
          style: BorderStyle.solid,
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 8.0,
            blurRadius: 8.0,
          )
        ],
      );

  factory CircleView.joystickInnerCircle(double size, Color color) =>
      CircleView(
        size: size,
        color: Color(0xff3587ED),
        inner: true,
        border: Border.all(

          color: Colors.black26,
          width: 0.0,
          style: BorderStyle.solid,
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 8.0,
            blurRadius: 8.0,
          )
        ],


      );

  factory CircleView.padBackgroundCircle(
          double size, Color backgroundColour, borderColor, Color shadowColor,
          {double opacity}) =>
      CircleView(
        size: size,
        color: backgroundColour,
        opacity: opacity,
        border: Border.all(
          color: borderColor,
          width: 4.0,
          style: BorderStyle.solid,
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: shadowColor,
            spreadRadius: 8.0,
            blurRadius: 8.0,
          )
        ],
      );

  factory CircleView.padButtonCircle(
    double size,
    Color color,
    Image image,
    Icon icon,
    String text,
  ) =>
      CircleView(
        inner: true,
        size: size,
        color: color,
        buttonImage: image,
        buttonIcon: icon,
        buttonText: text,
        border: Border.all(
          color: Colors.black26,
          width: 2.0,
          style: BorderStyle.solid,
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 8.0,
            blurRadius: 8.0,
          )
        ],
      );
}
