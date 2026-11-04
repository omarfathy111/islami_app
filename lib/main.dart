import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_routes.dart';
import 'package:islami_app/core/utils/app_theme.dart';
import 'package:islami_app/provider/most_recent_list.dart';
import 'package:islami_app/ui/screens/details/details_screen.dart';
import 'package:islami_app/ui/screens/home/home_screen.dart';
import 'package:islami_app/ui/screens/onpoarding/onpoarding_screen.dart';
import 'package:islami_app/ui/screens/splash/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {

  runApp(
    ChangeNotifierProvider(
      create: (context) => MostRecentListProvider(),
      child:  MyApp(),
    ),
  );

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
     debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splashRoute,
      routes: {
        AppRoutes.splashRoute :(context) => SplashScreen(),
        AppRoutes.homeRouteName: (context) => HomeScreen(),
        AppRoutes.onboardingRouteName: (context) => OnBoardingPage(),
        AppRoutes.detailsScreen: (context) => DetailsScreen(),
      },
    // theme: AppTheme.lightTheme,
     darkTheme: AppTheme.darkTheme,
     themeMode: ThemeMode.dark,
    );
  }
}
