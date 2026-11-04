import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_assets.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_routes.dart';
import 'package:islami_app/core/utils/app_size_utils.dart';
import 'package:islami_app/ui/screens/splash/widgets/image_widgets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
       Navigator.pushReplacementNamed(context, AppRoutes.onboardingRouteName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: ImageWidget(
              appAssets: AppAssets.objectsImage,
              height: AppSizeUtils.getheight(context) * 0.17,
              width: AppSizeUtils.getwidth(context) * 0.43,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ImageWidget(
              appAssets: AppAssets.routeGold,
              width: AppSizeUtils.getwidth(context) * 0.41,
              height: AppSizeUtils.getheight(context) * 0.09,
            ),
          ),
          
        ],
      ),
    );
  }
}
