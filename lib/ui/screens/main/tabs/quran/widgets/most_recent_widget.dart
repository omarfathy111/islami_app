import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_assets.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_routes.dart';
import 'package:islami_app/core/utils/app_size_utils.dart';
import 'package:islami_app/core/utils/app_styles.dart';
import 'package:islami_app/core/utils/shared_prefs_utils.dart';
import 'package:islami_app/models/quran_resourses.dart';
import 'package:islami_app/provider/most_recent_list.dart';
import 'package:provider/provider.dart';

class MostRecentWidget extends StatefulWidget {
  const MostRecentWidget({super.key});

  @override
  State<MostRecentWidget> createState() => _MostRecentWidgetState();
}

class _MostRecentWidgetState extends State<MostRecentWidget> {

  late MostRecentListProvider mostRecentListProvider;

  @override
  void initState() {
    
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      mostRecentListProvider.getLastSurahIndex();
    });
  }

  @override
  Widget build(BuildContext context) {
    mostRecentListProvider = Provider.of<MostRecentListProvider>(context);
    return Visibility(
      visible:mostRecentListProvider.mostRecentList.isNotEmpty,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: AppSizeUtils.getheight(context) * 0.01,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30.0,right: 250,bottom: 10),
            child: Text('Most Recently', style: AppStyles.bold16White),
          ),
          SizedBox(
            height: AppSizeUtils.getheight(context) * 0.18,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                   onTap: () {
                            Navigator.pushNamed(
                              context,
                              AppRoutes.detailsScreen,
                              arguments: mostRecentListProvider.mostRecentList[index],
                            );
                          },
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal:  AppSizeUtils.getwidth(context) * 0.04,
                      ),
                      child: Column(
                        children: [
                          Row(
                            spacing:  AppSizeUtils.getwidth(context) * 0.02,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(QuranResourses.englishQuranSurahsList[mostRecentListProvider.mostRecentList[index]], style: AppStyles.bold24Black),
                                  Text(QuranResourses.arabicQuranSurasList[mostRecentListProvider.mostRecentList[index]], style: AppStyles.bold24Black),
                                  Text('${QuranResourses.versesNumbersList[mostRecentListProvider.mostRecentList[index]]} Verse',style: AppStyles.bold14Black),
                                ],
                              ),
                              Image.asset(AppAssets.mostRecentImage),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(width: AppSizeUtils.getwidth(context) * 0.04);
              },
              itemCount: mostRecentListProvider.mostRecentList.length,
            ),
          ),
        ],
      ),
    );
  }
}
