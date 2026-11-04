import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_assets.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_routes.dart';
import 'package:islami_app/core/utils/app_size_utils.dart';
import 'package:islami_app/core/utils/app_styles.dart';
import 'package:islami_app/core/utils/shared_prefs_utils.dart';
import 'package:islami_app/models/quran_resourses.dart';
import 'package:islami_app/ui/screens/main/tabs/quran/widgets/most_recent_widget.dart';
import 'package:islami_app/ui/screens/main/tabs/quran/widgets/surah_item.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  List<int> filterList = List.generate(114, (index) => index);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizeUtils.getwidth(context) * 0.04,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
          _buildSearchSection(),
          MostRecentWidget(),

          Padding(
            padding: const EdgeInsets.only(top: 30.0,right: 300,bottom: 10),
            child: Text('Suras List', style: AppStyles.bold16White),
          ),

          _buildSurahListSection(
            onSurahItemClick: (index) {
              Navigator.pushNamed(
                context,
                AppRoutes.detailsScreen,
                arguments: index,
              );
            },
          ),
        ],
       ) ),
    );
  }

  OutlineInputBorder _buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(width: 2, color: AppColors.primaryColor),
    );
  }

  Widget _buildSearchSection() {
    return TextField(
      cursorColor: AppColors.whiteColor,
      style: TextStyle(
        color: AppColors.primaryColor,
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
      decoration: InputDecoration(
        prefixIcon: Image.asset(AppAssets.iconquransvg),
        hintText: 'Sura Name',
        enabledBorder: _buildOutlineInputBorder(),
        focusedBorder: _buildOutlineInputBorder(),
        hintStyle: AppStyles.bold14White,
      ),
      onChanged: (text) {
        searchBySurahNmae(text);
      },
    );
  }

  Widget _buildSurahListSection({
    required void Function(int) onSurahItemClick,
  }) {
    return filterList.isEmpty
        ? Text('No Surah Name Found', style: AppStyles.bold20Primary)
        : ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  saveLastSurahIndex(filterList[index]);
                  onSurahItemClick(filterList[index]);
                },
                child: SurahItem(index: filterList[index]),
              );
            },
            separatorBuilder: (context, index) {
              return Divider(
                thickness: 2,
                height: AppSizeUtils.getheight(context) * 0.02,
                color: AppColors.whiteColor,
                indent: AppSizeUtils.getwidth(context) * 0.06,
                endIndent: AppSizeUtils.getwidth(context) * 0.06,
              );
            },
            itemCount: filterList.length,
          );
  }

  void searchBySurahNmae(String surahName) {
    List<int> searchList = [];
    for (int i = 0; i < QuranResourses.englishQuranSurahsList.length; i++) {
      if (QuranResourses.englishQuranSurahsList[i].toLowerCase().contains(
            surahName.toLowerCase(),
          ) ||
          QuranResourses.arabicQuranSurasList[i].contains(surahName)) {
        searchList.add(i);
      }
      filterList = searchList;
      setState(() {});
    }
  }
}
