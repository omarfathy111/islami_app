import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_size_utils.dart';
import 'package:islami_app/core/utils/app_styles.dart';

class ContentItem extends StatelessWidget {
  final String content;
  final double? paddingHorizontal;
  final TextStyle? style;
  const ContentItem({super.key,required this.content,this.paddingHorizontal,this.style});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal:  paddingHorizontal ??  AppSizeUtils.getwidth(context) * 0.04),
      child: Text(
       content,
        style: style ?? AppStyles.bold24Black,
        textDirection: TextDirection.rtl,
      textAlign: TextAlign.center,
      ),
    );
  }
}