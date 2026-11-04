import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/core/utils/app_assets.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_size_utils.dart';
import 'package:islami_app/core/utils/app_styles.dart';
import 'package:islami_app/models/quran_resourses.dart';
import 'package:islami_app/provider/most_recent_list.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  //List<String> verses = [];
  String verses = "";

  late MostRecentListProvider mostRecentListProvider;

  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)?.settings.arguments as int;
    // if (verses.isEmpty) {
    //   loadSurshFile(index);
    // }
    mostRecentListProvider = Provider.of(context);
    loadSurshFile(index);
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(title: Text(QuranResourses.englishQuranSurahsList[index])),
      body: Column(
        spacing: AppSizeUtils.getheight(context) * 0.02,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSizeUtils.getwidth(context) * 0.04,
            ),
            child: Stack(
              alignment: AlignmentGeometry.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(AppAssets.imgleftcorner),
                    Image.asset(AppAssets.imgrightcorner),
                  ],
                ),
                Text(
                  QuranResourses.arabicQuranSurasList[index],
                  style: AppStyles.bold20Primary,
                ),
              ],
            ),
          ),
          Expanded(
            child: verses.isEmpty
                ? Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    ),
                  )
                : SingleChildScrollView(
                    child: Text(
                      verses,
                      style: AppStyles.bold20Primary,
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.center,
                    ),
                  ),
          ),

          Image.asset(AppAssets.mosqueImage),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    mostRecentListProvider.getLastSurahIndex();
  }

  void loadSurshFile(int index) async {
    String fileContent = await rootBundle.loadString(
      'assets/files/quran/${index + 1}.txt',
    );
    List<String> lines = fileContent.split('\n');
    for (int i = 0; i < lines.length; i++) {
      lines[i] += "[ ${i + 1} ]";
    }

    verses = lines.join('');
    setState(() {});
  }
}
