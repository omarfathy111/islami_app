import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_assets.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_size_utils.dart';
import 'package:islami_app/ui/screens/main/tabs/hadeeth/hadeeth_tab.dart';
import 'package:islami_app/ui/screens/main/tabs/quran/quran_tab.dart';
import 'package:islami_app/ui/screens/main/tabs/radio/radio_tab.dart';
import 'package:islami_app/ui/screens/main/tabs/sebha/sebha_tab.dart';
import 'package:islami_app/ui/screens/main/tabs/time/time_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  List<Widget> tabs = [
    QuranTab(),
    HadeethTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab(),
  ];

  List<String> backgroundImagesList = [
    AppAssets.quranbg,
    AppAssets.hadithbg,
    AppAssets.sebhabg,
    AppAssets.radiobg,
    AppAssets.timebg,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.transparentColor,
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(canvasColor: AppColors.primaryColor),
        child: BottomNavigationBar(
         
          currentIndex: selectedIndex,
          onTap: (index) {
            selectedIndex = index;
            setState(() {});
          },
          items: [
            buildBottomNavigationBarItem(
              iconPath: AppAssets.iconquran,
              label: 'Quran',
              index: 0,
            ),
            buildBottomNavigationBarItem(
              iconPath: AppAssets.iconhadeth,
              label: 'Hadeth',
              index: 1,
            ),
            buildBottomNavigationBarItem(
              iconPath: AppAssets.iconsebha,
              label: 'Sebha',
              index: 2,
            ),
            buildBottomNavigationBarItem(
              iconPath: AppAssets.iconradio,
              label: 'Radio',
              index: 3,
            ),
            buildBottomNavigationBarItem(
              iconPath: AppAssets.icontime,
              label: 'Time',
              index: 4,
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Image.asset(
            backgroundImagesList[selectedIndex],
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          SafeArea(
            child: Padding(
              padding:  EdgeInsets.symmetric(vertical: AppSizeUtils.getheight(context)*0.02),
              child: Column(
                children: [
                  Image.asset(AppAssets.logo),
                  Expanded(child: tabs[selectedIndex]),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  BottomNavigationBarItem buildBottomNavigationBarItem({
    required String iconPath,
    required String label,
    required int index,
  }) {
    return BottomNavigationBarItem(
      icon: selectedIndex == index
          ? Container(
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
              decoration: BoxDecoration(
                color: AppColors.lightBlackColor,
                borderRadius: BorderRadius.circular(66),
              ),
              child: ImageIcon(AssetImage(iconPath)),
            )
          : ImageIcon(AssetImage(iconPath)),
      label: label,
    );
  }
}
