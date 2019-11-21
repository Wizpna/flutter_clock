import 'package:flutter/material.dart';
import 'package:flutter_clock/clock_dial_painter.dart';
import 'package:flutter_clock/clock_hands.dart';
import 'package:flutter_clock/clock_text.dart';

class ClockFace extends StatelessWidget{

  final DateTime dateTime;
  final ClockText clockText;

  ClockFace({this.clockText = ClockText.arabic,  this.dateTime});

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.all(10.0),
      child: new AspectRatio(
        aspectRatio: 1.0,
        child: new Container(
          width: double.infinity,
          decoration: new BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),

          child: new Stack(
            children: <Widget>[
              //dial and numbers
              new Container(
                width: double.infinity,
                height: double.infinity,
                padding: const EdgeInsets.all(10.0),
                child:new CustomPaint(
                  painter: new ClockDialPainter(clockText: clockText),
                ),
              ),


              new ClockHands(dateTime:dateTime, ),

            ],
          ),
        ),

      ),
    );
  }
}