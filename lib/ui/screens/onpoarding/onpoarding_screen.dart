import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islami_app/core/utils/app_assets.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/ui/screens/home/home_screen.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  OnBoardingPageState createState() => OnBoardingPageState();
}

class OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(BuildContext context) {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (_) => const HomeScreen()));
  }

  Widget _buildImage(
    String assetName, {
    double width = 372,
    double height = 372,
  }) {
    return Image.asset(assetName, width: width, height: height);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0,color: AppColors.primaryColor);

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: AppColors.primaryColor),
      bodyTextStyle: bodyStyle,
    
      pageColor: AppColors.blackColor,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      
      globalHeader: Align(
        alignment: Alignment.center,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 6),
            child: _buildImage(AppAssets.logo,height: 171,width: 291),
          ),
        ),
      ),
     
      pages: [
        PageViewModel(
          title: "Welcome To Islmi App",
          body: "We Are Very Excited To Have You In Our Community",
          image: _buildImage(AppAssets.frame3),
          decoration: pageDecoration.copyWith(
            contentMargin: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 40,
            ),
            bodyFlex: 2,
            imageFlex: 11,
            
          ),
        ),
        PageViewModel(
          title: "Welcome To Islami",
          body: "We Are Very Excited To Have You In Our Community",
          image: _buildImage(AppAssets.frame3_1),
          decoration: pageDecoration.copyWith(
            contentMargin: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 40,
            ),
            bodyFlex: 2,
            imageFlex: 11,
            
          ),
        ),
       PageViewModel(
          title: "Reading the Quran",
          body: "Read, and your Lord is the Most Generous",
          image: _buildImage(AppAssets.frame3_2),
          decoration: pageDecoration.copyWith(
            contentMargin: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 40,
            ),
            bodyFlex: 2,
            imageFlex: 11,
            
          ),
        ),
        PageViewModel(
          title: "Bearish",
          body: "Praise the name of your Lord, the Most High",
          image: _buildImage(AppAssets.frame3_3),
          decoration: pageDecoration.copyWith(
            contentMargin: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 40,
            ),
            bodyFlex: 2,
            imageFlex: 11,
            
          ),
        ),
         PageViewModel(
          title: "Holy Quran Radio",
          body: "You can listen to the Holy Quran Radio through the application for free and easily",
          image: _buildImage(AppAssets.frame3_4),
          decoration: pageDecoration.copyWith(
            contentMargin: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 40,
            ),
            bodyFlex: 2,
            imageFlex: 11,
            
          ),
        ),
       
      ],
      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: true,
      
      //rtl: true, // Display as right-to-left
      back: const Text('Back', style: TextStyle(fontWeight: FontWeight.w600, color: AppColors.primaryColor)),
      skip: const Text('Back', style: TextStyle(fontWeight: FontWeight.w600, color: AppColors.primaryColor),),
      next: const Text('Next', style: TextStyle(fontWeight: FontWeight.w600, color: AppColors.primaryColor)),
      done: const Text('Next', style: TextStyle(fontWeight: FontWeight.w600, color: AppColors.primaryColor)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
    globalBackgroundColor: AppColors.blackColor,
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: AppColors.greyColor,
        activeColor: AppColors.primaryColor,
        
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator:  ShapeDecoration(
        
        shape: RoundedRectangleBorder(
          
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}
