import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_size_utils.dart';
import 'package:islami_app/ui/screens/main/tabs/hadeeth/widgets/hadeeth_item.dart';

class HadeethTab extends StatelessWidget {
  HadeethTab({super.key});

  List<int> itemsIndex = List.generate(50, (index) => index + 1);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: AppSizeUtils.getheight(context) * 0.60,
        enlargeCenterPage: true,
        enableInfiniteScroll: false,
      ),
      items: itemsIndex.map((index) => HadeethItem(index: index)).toList(),
    );
  }
}
