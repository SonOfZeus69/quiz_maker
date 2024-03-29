import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

void showFloatingFlushbar(BuildContext context, String text) {
    Flushbar(
      duration: const Duration(seconds: 5),
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(10),
      backgroundGradient: LinearGradient(
        colors: [Colors.blue.shade800, Colors.blueAccent.shade700],
        stops: const [0.6, 1],
      ),
      boxShadows: const [
        BoxShadow(
          color: Colors.black45,
          offset: Offset(3, 3),
          blurRadius: 3,
        ),
      ],
      // All of the previous Flushbars could be dismissed by swiping down
      // now we want to swipe to the sides
      dismissDirection: FlushbarDismissDirection.HORIZONTAL,
      // The default curve is Curves.easeOut
      forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
      flushbarPosition: FlushbarPosition.TOP,
      title: 'Success',
      message: text,
    ).show(context);
  }
