import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_clock/clock_face.dart';
import 'package:flutter_clock/clock_text.dart';

typedef TimeProducer = DateTime Function();

class Clock extends StatefulWidget {

  final Color circleColor;
  final bool showBellsAndLegs;
  final Color bellColor;
  final Color legColor;
  final ClockText clockText;
  final bool showHourHandleHeartShape;
  final TimeProducer getCurrentTime;
  final Duration updateDuration;

  Clock({this.circleColor = Colors.black,
    this.showBellsAndLegs = true,
    this.bellColor = const Color(0xFF333333),
    this.legColor = const Color(0xFF555555),
    this.clockText = ClockText.arabic,
    this.showHourHandleHeartShape = false,
    this.getCurrentTime = getSystemTime,
    this.updateDuration = const Duration(seconds: 1)});

  static DateTime getSystemTime() {
    return new DateTime.now();
  }

  @override
  State<StatefulWidget> createState() {
    return _Clock();
  }
}

class _Clock extends State<Clock> {
  Timer _timer;
  DateTime dateTime;

  @override
  void initState() {
    super.initState();
    dateTime = new DateTime.now();
    this._timer = new Timer.periodic(widget.updateDuration, setTime);
  }

  void setTime(Timer timer) {
    setState(() {
      dateTime = new DateTime.now();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new AspectRatio(
      aspectRatio: 1.0,
      child: buildClockCircle(context),

    );
  }

  Container buildClockCircle(BuildContext context) {
    return new Container(
      width: double.infinity,
      decoration: new BoxDecoration(
        shape: BoxShape.circle,
        color: widget.circleColor,
        boxShadow: [
          new BoxShadow(
            offset: new Offset(0.0, 5.0),
            blurRadius: 5.0,
          )
        ],
      ),

      child: new ClockFace(
        clockText : widget.clockText,
        dateTime: dateTime,
      ),

    );
  }

}

