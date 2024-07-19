import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

extension Box on num {
  SizedBox get h => SizedBox(height: toDouble());
  SizedBox get w => SizedBox(width: toDouble());
}

extension Pad on Widget {
  Padding padding(EdgeInsetsGeometry? size) => Padding(
        padding: size ?? EdgeInsets.zero,
        child: this,
      );
}
