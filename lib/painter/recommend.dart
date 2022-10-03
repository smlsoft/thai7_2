import 'package:flutter/material.dart';
import 'package:thai7/painter/taglabel.dart';

Widget recommendTag(
    {double width = 40,
    double height = 40,
    String header = "Header",
    String title = "Title"}) {
  return Stack(
    children: [
      SizedBox(
          width: width,
          height: height,
          child: CustomPaint(
            painter: TagLabel(),
          )),
      SizedBox(
          width: width,
          height: height - (height * 0.25),
          child: FittedBox(
              child: Center(
                  child: Column(children: [
            Text(header,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(1.0, 1.0),
                      blurRadius: 3.0,
                      color: Colors.black,
                    ),
                  ],
                )),
            Text(title,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(1.0, 1.0),
                      blurRadius: 3.0,
                      color: Colors.white,
                    ),
                    Shadow(
                      offset: Offset(1.0, 1.0),
                      blurRadius: 8.0,
                      color: Colors.white,
                    ),
                  ],
                ))
          ])))),
    ],
  );
}
