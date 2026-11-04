import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_assets.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_size_utils.dart';
import 'package:islami_app/core/utils/app_styles.dart';

class ContainerRadio extends StatelessWidget {
  const ContainerRadio({super.key, required this.index});

  final int index ;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSizeUtils.getwidth(context) * 0.90,
      height: AppSizeUtils.getheight(context) *0.16,
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),

      child: Stack(
        alignment: AlignmentGeometry.bottomCenter,
        children: [
          Column(
            children: [
              Text('Ibrahim Al-Akdar', style: AppStyles.bold20Black),
              Stack(
                alignment: AlignmentGeometry.bottomCenter,

                children: [
                index == 1 ?
                    Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: Image.asset(AppAssets.soundWave,color: AppColors.greyColor,),
                    )
                  :
                  Image.asset(AppAssets.mosqueRadio),
                 index == 1 ?

                  IconButton(
                    icon: Icon(
                      Icons.pause,
                      color: AppColors.blackColor,
                      size: 50,
                    ),
                    onPressed: () {},
                  ) :

                  IconButton(
                    icon: Icon(
                      Icons.play_arrow,
                      color: AppColors.blackColor,
                      size: 50,
                    ),
                    onPressed: () {},
                  ),
                  index == 1 ?
                  Padding(
                    padding: const EdgeInsets.only(left: 120),
                    child: IconButton(
                      icon: Icon(
                        Icons.volume_down
                        ,
                        color: AppColors.blackColor,
                        size: 30,
                      ),
                      onPressed: () {},
                    ),
                  ) :
                  Padding(
                    padding: const EdgeInsets.only(left: 120),
                    child: IconButton(
                      icon: Icon(
                        Icons.volume_up,
                        color: AppColors.blackColor,
                        size: 30,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
