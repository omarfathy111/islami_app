import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_assets.dart';
import 'package:islami_app/core/utils/app_size_utils.dart';
import 'package:islami_app/core/utils/app_styles.dart';
import 'package:islami_app/models/quran_resourses.dart';

class SurahItem extends StatelessWidget {
  final int index;
  const SurahItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing:AppSizeUtils.getwidth(context)*0.06 ,
      children: [
        Stack(
          alignment: AlignmentGeometry.center,
          children: [
            Image.asset(AppAssets.vector),
            Text('${index + 1}', style: AppStyles.bold16White),
          ],
        ),
        Column(
          spacing: AppSizeUtils.getheight(context)*0.01,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              QuranResourses.englishQuranSurahsList[index],
              style: AppStyles.bold20White,
            ),
            Text(
              '${QuranResourses.versesNumbersList[index]} Verse',
              style: AppStyles.bold14White,
            ),
          ],
        ),
        Spacer(),
        Text(
          QuranResourses.arabicQuranSurasList[index],
          style: AppStyles.bold20White,
        ),
      ],
    );
  }
}
