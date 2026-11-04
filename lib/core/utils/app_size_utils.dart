import 'package:flutter/material.dart';

class AppSizeUtils {
  static double getwidth(BuildContext context) =>
      MediaQuery.of(context).size.width;
  static double getheight(BuildContext context) =>
      MediaQuery.of(context).size.height;
}

extension SizeUtils on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
}
