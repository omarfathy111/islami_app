// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  String appAssets;
  double? height;
  double? width;

  ImageWidget({super.key, required this.appAssets, this.height, this.width});
  @override
  Widget build(BuildContext context) {
    return  Image.asset(appAssets, height: height ?? 0, width: width ?? 0);
  }
}
