import 'dart:math';

import 'package:globaleyes/common_imports.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomProgressBar extends StatelessWidget {
  double borderWidth;
  Color borderColor;

  double progressHeight;
  Color progressColor;
  Color nonProgressColor;

  double stepCount;
  double stepRadius;

  Color progressStepColor;
  Color nonProgressStepColor;

  double stepBorderWidth;
  Color stepBorderColor;

  double progressMin;
  double progressMax;
  double progressCurrent;

  Color stepTextColor;
  double stepTextSize;
  double stepTextMargin;

  CustomProgressBar({
    this.borderWidth: 2,
    this.borderColor: Colors.black,
    this.progressHeight: 10,
    this.progressColor: Colors.blue,
    this.nonProgressColor: Colors.white,
    this.stepCount: 7,
    this.stepRadius: 10,
    this.progressStepColor: Colors.blue,
    this.nonProgressStepColor: Colors.white,
    this.stepBorderWidth: 2,
    this.stepBorderColor: Colors.black,
    this.progressMin: 0,
    this.progressMax: 3000,
    this.progressCurrent: 1000,
    this.stepTextColor: Colors.black,
    this.stepTextSize: 14,
    this.stepTextMargin: 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // pass double.infinity to prevent shrinking of the painter area to 0.
      width: double.infinity,
      child: CustomPaint(
          painter: FaceOutlinePainter(
        borderWidth: borderWidth,
        borderColor: borderColor,
        progressHeight: progressHeight,
        progressColor: progressColor,
        nonProgressColor: nonProgressColor,
        stepCount: stepCount,
        stepRadius: stepRadius,
        progressStepColor: progressStepColor,
        nonProgressStepColor: nonProgressStepColor,
        stepBorderWidth: stepBorderWidth,
        stepBorderColor: stepBorderColor,
        progressMin: progressMin,
        progressMax: progressMax,
        progressCurrent: progressCurrent,
        stepTextColor: stepTextColor,
        stepTextSize: stepTextSize,
        stepTextMargin: stepTextMargin,
      )),
    );
  }
}

class FaceOutlinePainter extends CustomPainter {
  FaceOutlinePainter({
    this.borderWidth = 2,
    this.borderColor = Colors.black,
    this.progressHeight = 10,
    this.progressColor = Colors.blue,
    this.nonProgressColor = Colors.white,
    this.stepCount = 7,
    this.stepRadius = 10,
    this.progressStepColor = Colors.blue,
    this.nonProgressStepColor = Colors.white,
    this.stepBorderWidth = 2,
    this.stepBorderColor = Colors.black,
    this.progressMin = 0,
    this.progressMax = 3000,
    this.progressCurrent = 1000,
    this.stepTextColor = Colors.black,
    this.stepTextSize = 14,
    this.stepTextMargin = 0,
  }) {
    init();
  }

  double borderWidth;
  Color borderColor;

  double progressHeight;
  Color progressColor;
  Color nonProgressColor;

  double stepCount;
  double stepRadius;

  Color progressStepColor;
  Color nonProgressStepColor;

  double stepBorderWidth;
  Color stepBorderColor;

  double progressMin;
  double progressMax;
  double progressCurrent;

  Color stepTextColor;
  double stepTextSize;
  double stepTextMargin;

  Rect? rectF;
  Rect? oval;
  Path? myPath;

  @override
  void paint(Canvas canvas, Size size) {
    // Define a paint object
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0
      ..color = Colors.indigo;

    double start;
    double top;
    double end;
    double bottom;

    double paddingLeft = 0;
    double paddingTop = 0;
    double paddingRight = 0;
    double paddingBottom = 0;

    if (progressCurrent > progressMax) {
      progressCurrent = progressMax;
    }

    if (progressCurrent < progressMin) {
      progressCurrent = progressMin;
    }

    start = (paddingLeft + stepRadius + (stepBorderWidth / 2));
    top = (paddingTop +
        stepRadius +
        (stepBorderWidth / 2) -
        (progressHeight / 2));
    end = (size.width - paddingRight - stepRadius - (stepBorderWidth / 2));
    bottom = (top + (progressHeight));
    // }

    double progressLength = end - start;
    double progressEnd = (start +
        ((progressLength *
                getPercentForMinMax(
                    progressMin, progressMax, progressCurrent)) /
            100));

    rectF = Rect.fromLTRB(start, top, end, bottom);

    // Draw non-progress
    paint.style = PaintingStyle.fill;
    paint.color = nonProgressColor;
    canvas.drawRRect(
        RRect.fromRectAndRadius(rectF!, Radius.circular(stepRadius)), paint);

    // Draw progress
    rectF = Rect.fromLTRB(start, top, progressEnd, bottom);
    paint.color = progressColor;
    canvas.drawRRect(
        RRect.fromRectAndRadius(rectF!, Radius.circular(stepRadius)), paint);

    // Draw progress-bar border
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = borderWidth;
    paint.color = borderColor;
    rectF = Rect.fromLTRB(start, top, end, bottom);
    canvas.drawRRect(
        RRect.fromRectAndRadius(rectF!, Radius.circular(stepRadius)), paint);

    // Draw progressSteps
    double progressPercent =
        getPercentForMinMax(progressMin, progressMax, progressCurrent);
    double progressedTillStep = (progressCurrent == progressMin)
        ? -1
        : getProgressForPercent(0, stepCount - 1, progressPercent);
    double stepWidth = progressLength / (stepCount - 1);

    for (int i = 0; i < stepCount; i++) {
      myPath!.reset();

      paint.style = PaintingStyle.fill;
      paint.strokeWidth = stepBorderWidth;

      if (i <= progressedTillStep) {
        paint.color = progressStepColor;
      } else {
        paint.color = nonProgressStepColor;
      }

      double cx = start + (stepWidth * i);
      double cy = paddingTop + stepRadius + (stepBorderWidth / 2);

      canvas.drawCircle(Offset(cx, cy), stepRadius, paint);

      paint.style = PaintingStyle.stroke;
      paint.color = stepBorderColor;
      paint.strokeCap = StrokeCap.round;

      updateOval(cx, cy, stepRadius);

      double h = stepRadius;

      double l = (progressHeight / 2) + (borderWidth / 4);

      double intersectingAngle = toDegrees((pi / 2) - atan(h / l));

      if (i == 0) {
        myPath!.arcTo(oval!, 69.63, 30.37, true);
        canvas.drawPath(myPath!, paint);
      } else if (i == stepCount - 1) {
        myPath!.arcTo(oval!, 79.07, 30.37, true);
        canvas.drawPath(myPath!, paint);
      } else {
        myPath!.arcTo(oval!, 79.07, 39.8, true);
        canvas.drawPath(myPath!, paint);

        myPath!.reset();

        myPath!.arcTo(oval!, 119.9, 27.23, true);
        canvas.drawPath(myPath!, paint);
      }
    }

    //Text on Canvas

    stepWidth = progressLength / (stepCount - 1);

    double progressPerStep = (progressMax - progressMin) / (stepCount - 1);

    for (int i = 0; i < stepCount; i++) {
      String text;
      text = (i * progressPerStep).toInt().toString();
      TextSpan span1 = new TextSpan(
          style: new TextStyle(
              color: stepTextColor,
              fontSize: stepTextSize,
              fontFamily: FontsFamily.GilroyRegular,
              fontWeight: FontWeights.regular),
          text: text);
      TextPainter tp1 = new TextPainter(
          text: span1,
          textAlign: TextAlign.left,
          textDirection: TextDirection.ltr);
      tp1.layout();
      double textWidth = tp1.width;
      double x;
      x = (start + (stepWidth * i) - (textWidth / 2));
      double y;
      y = (top + (stepRadius * 2) + stepBorderWidth + stepTextMargin);
      tp1.paint(canvas, new Offset(x - (stepTextMargin / 5), y));
    }
  }

  @override
  bool shouldRepaint(FaceOutlinePainter oldDelegate) => false;

  void init() {
    rectF = new Rect.fromLTRB(0, 0, 0, 0);
    oval = new Rect.fromLTRB(0, 0, 0, 0);
    myPath = new Path();
  }

  double getPercentForMinMax(double min, double max, double current) {
    if (min > max)
      throw new Exception("'min' value cannot be greater than 'max'");

    if (current < min)
      throw new Exception("'current' value cannot be smaller than 'min'");

    if (current > max)
      throw new Exception("'current' value cannot be greater than 'max'");

    double range = max - min;
    double correctedStartValue = current - min;

    return (correctedStartValue * 100) / range;
  }

  double getProgressForPercent(double min, double max, double percent) {
    if (min > max)
      throw new Exception("'min' value cannot be greater than 'max'");

    if (percent < 0 || percent > 100)
      throw new Exception("Invalid percentage input");

    return (percent * (max - min) / 100) + min;
  }

  void updateOval(double x, double y, double radius) {
    oval = Rect.fromLTRB(x - radius, y - radius, x + radius, y + radius);
  }

  double toDegrees(double d) {
    return d * 180.0 / pi;
  }
}
