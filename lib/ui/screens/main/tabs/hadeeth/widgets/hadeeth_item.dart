import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/core/utils/app_assets.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_size_utils.dart';
import 'package:islami_app/core/utils/app_styles.dart';
import 'package:islami_app/models/hadeeth_model.dart';
import 'package:islami_app/ui/screens/main/tabs/hadeeth/widgets/content_item.dart';

class HadeethItem extends StatefulWidget {
  final int index;

  const HadeethItem({super.key, required this.index});

  @override
  State<HadeethItem> createState() => _HadeethItemState();
}

class _HadeethItemState extends State<HadeethItem> {
  HadeethModel? hadeeth;

  @override
  void initState() {
    super.initState();
    loadHadeethFile();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.primaryColor,
        //     image: DecorationImage(image: AssetImage(AppAssets.hadeethBackGround,),)
      ),
      child: hadeeth == null
          ? CircularProgressIndicator()
          : Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppSizeUtils.getwidth(context) * 0.02,
                        vertical: AppSizeUtils.getheight(context) * 0.01,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            AppAssets.imgleftcorner,
                            color: AppColors.blackColor,
                          ),
                          Image.asset(
                            AppAssets.imgrightcorner,
                            color: AppColors.blackColor,
                          ),
                        ],
                        
                      ),
                      
                    ),
                   ContentItem(content: hadeeth?.title ?? '',),
           //      ContentItem(content: hadeeth?.content ?? '',)
                  ],
                ),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: ContentItem(
                        content: hadeeth?.content ?? '',style: AppStyles.bold24Black.copyWith(fontSize: 16),
                      ),
                  ),
                ),
                Image.asset(
                  AppAssets.hadeethMosque,
           
                ),
              ],
            ),
    );
  }

  void loadHadeethFile() async {
    String hadeethContentFile = await rootBundle.loadString(
      'assets/files/hadeeth/h${widget.index}.txt',
    );

    int newLineIndex = hadeethContentFile.indexOf('\n');
    String title = hadeethContentFile.substring(0, newLineIndex);
    String content = hadeethContentFile.substring(newLineIndex + 1);

    hadeeth = HadeethModel(title: title, content: content);
    setState(() {});
  }
}
