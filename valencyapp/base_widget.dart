import 'package:flutter/material.dart';

class BaseWidget extends StatefulWidget {
  const BaseWidget({super.key});

  @override
  _BaseWidgetState createState() => _BaseWidgetState();
}

class _BaseWidgetState extends State<BaseWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 300,
        height: 300,
        child: ClipRect(
          child: Align(
            alignment: Alignment.bottomCenter,
            heightFactor: 0.25,
            child: CustomPaint(
              painter: BaseWidgetPainter(),
            ),
          ),
        ));
  }
}

class BaseWidgetPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    //throw UnimplementedError();
    return true;
  }
}