import 'package:flutter/material.dart';

class TagLabel extends CustomPainter {
  Color color;
  TagLabel({this.color = Colors.orange});

  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();
    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    Paint shadowPaint = Paint()
      ..color = Colors.grey.withAlpha(75)
      ..style = PaintingStyle.fill;
    double widthDiv = (size.width / 4);
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width - widthDiv, size.height / 1.25);
    path.lineTo(size.width - (widthDiv * 2), size.height);
    path.lineTo(size.width - (widthDiv * 3), size.height / 1.25);
    path.lineTo(size.width - (widthDiv * 4), size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);
//
    canvas.drawPath(path.shift(const Offset(2, 2)), shadowPaint);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(TagLabel oldDelegate) {
    return oldDelegate.color != color;
  }
}
