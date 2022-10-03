import 'package:flutter/material.dart';
import 'package:thai7/painter/taglabel.dart';

class StarPersentPainter extends CustomPainter {
  Color color;
  double persent;

  StarPersentPainter({this.color = Colors.orange, required this.persent});

  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();
    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    double widthPersent = (size.width * persent) / 100.0;
    path.moveTo(0, 0);
    path.lineTo(widthPersent, 0);
    path.lineTo(widthPersent, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(StarPersentPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}

Widget starPersent({
  double width = 100,
  double height = 20,
  double persent = 0.0,
}) {
  return Stack(
    children: [
      SizedBox(
          width: width,
          height: height,
          child: Stack(
            children: [
              Positioned(
                  top: 0,
                  left: 0,
                  child: SizedBox(
                      width: width,
                      height: height,
                      child: CustomPaint(
                        painter: StarPersentPainter(persent: persent),
                      ))),
              Positioned(
                  top: 0,
                  left: 0,
                  child: SizedBox(
                      width: width,
                      height: height,
                      child: const FittedBox(
                        fit: BoxFit.fill,
                        child: Image(image: AssetImage("assets/fivestar.png")),
                      )))
            ],
          )),
    ],
  );
}
