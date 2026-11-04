import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_styles.dart';

class AppTheme {
 
  static ThemeData darkTheme = ThemeData(
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
       selectedItemColor: AppColors.whiteColor,
          unselectedItemColor: AppColors.blackColor,
          selectedLabelStyle: AppStyles.bold16Primary
    ),
   appBarTheme: AppBarThemeData(
      titleTextStyle: AppStyles.bold20Primary,
      centerTitle: true,
      backgroundColor: AppColors.blackColor,
      iconTheme: IconThemeData(color: AppColors.primaryColor),
    ),
  );
}
