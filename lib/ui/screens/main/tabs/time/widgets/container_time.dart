import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_size_utils.dart';
import 'package:islami_app/core/utils/app_styles.dart';

class ContainerTime extends StatelessWidget {
  final Map<String, String> prayer;

  const ContainerTime({super.key, required this.prayer});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSizeUtils.getwidth(context) * 0.24,
      height: AppSizeUtils.getheight(context) * 0.15,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xff202020), Color(0xffB19768)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),

        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        spacing: 12,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(prayer['name']!, style: AppStyles.bold16White),
          Text(prayer['time']!, style: AppStyles.bold20White),
          Text(prayer['period']!, style: AppStyles.bold16White),
        ],
      ),
    );
  }
}
