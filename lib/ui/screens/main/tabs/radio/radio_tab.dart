import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_styles.dart';
import 'package:islami_app/ui/screens/main/tabs/radio/widget/container_radio.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 185,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,

                    border: Border.all(width: 2.0),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      'Radio',
                      style: AppStyles.bold16Black,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Container(
                  width: 185,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppColors.blackColor,

                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      'Reciters',
                      style: AppStyles.bold16White,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 4,
              itemBuilder: (context, index) {
                return ContainerRadio(index: index);
              },
            ),
          ],
        ),
      ),
    );
  }
}
