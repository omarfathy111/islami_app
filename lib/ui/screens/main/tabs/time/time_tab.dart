import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_assets.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_size_utils.dart';
import 'package:islami_app/core/utils/app_styles.dart';
import 'package:islami_app/ui/screens/main/tabs/time/widgets/container_time.dart';

class TimeTab extends StatefulWidget {
  const TimeTab({super.key});

  @override
  State<TimeTab> createState() => _TimeTabState();
}

class _TimeTabState extends State<TimeTab> {
  int index = 0;

  final List<Map<String, String>> prayers = const [
    {'name': 'Fajr', 'time': '04:54', 'period': 'AM'},
    {'name': 'Dhuhr', 'time': '01:01', 'period': 'PM'},
    {'name': 'ASR', 'time': '04:38', 'period': 'PM'},
    {'name': 'Maghrib', 'time': '07:57', 'period': 'PM'},
    {'name': 'Isha', 'time': '09:10', 'period': 'PM'},
  ];

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        
        child: Column(
          spacing: 12,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: AppSizeUtils.getwidth(context) * 0.95,
              height: AppSizeUtils.getheight(context) * 0.35,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,

                borderRadius: BorderRadius.circular(20),
              ),
              child: Stack(
                children: [
                  Column(
                    spacing: 10,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '16 Jul,\n 2024',
                              style: AppStyles.bold16White,
                            ),
                            Text(
                              'Pray Time \n Tuesday',
                              style: AppStyles.bold20Black,
                            ),
                            Text('09 Muh,\n1446', style: AppStyles.bold16White),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          spacing: 7,
                          children: [
                          ContainerTime(prayer: prayers[0]),
                          ContainerTime(prayer: prayers[1]), 
                          ContainerTime(prayer: prayers[2]),
                          ContainerTime(prayer: prayers[3]),
                          ContainerTime(prayer: prayers[4]),
                             
                          ],
                        ),
                      ),
                      Text('Next Pray - 02:32', style: AppStyles.bold16Black),
                    ],
                  ),
                ],
              ),
            ),
            Text('Azkar', style: AppStyles.bold16White),
            Row(
              spacing: 12,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: AppSizeUtils.getwidth(context)*0.43,
                  height: AppSizeUtils.getheight(context)*0.30,
                  decoration: BoxDecoration(
                    color: AppColors.blackColor,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      width: 2.0,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  child: Column(
                    children: [
                      Image.asset(AppAssets.bellIcon),
                      Text('Evening Azkar', style: AppStyles.bold20White),
                    ],
                  ),
                ),
                Container(
                    width: AppSizeUtils.getwidth(context)*0.43,
                  height: AppSizeUtils.getheight(context)*0.30,
                  decoration: BoxDecoration(
                    color: AppColors.blackColor,

                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      width: 2.0,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  child: Column(
                    children: [
                      Image.asset(AppAssets.commentBubble),
                      Text('Morning Azkar', style: AppStyles.bold20White),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
