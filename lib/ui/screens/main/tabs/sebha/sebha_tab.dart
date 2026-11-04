import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_assets.dart';
import 'package:islami_app/core/utils/app_styles.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  double _currentAngle = 0.0;

  int numberOfTasbeehs = 0;
  int currentIndex = 0;

  List<String> tabs = [
    'سبحان الله',
    'الحمد الله',
    'لا إله إلا الله',
    'الله اكبر',
  ];

  void rotatesebha() {
    setState(() {
      _currentAngle += 0.1;
      numberOfTasbeehs++;
      if (numberOfTasbeehs > 33) {
        numberOfTasbeehs = 0;
        currentIndex += 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('سَبِّحِ اسْمَ رَبِّكَ الأعلى ', style: AppStyles.bold36White),
        Stack(
          alignment: AlignmentGeometry.center,
          children: [
            Column(
              
              children: [
                Image.asset(AppAssets.minisebha),

                GestureDetector(
                  onTap: rotatesebha,
                  child: Transform.rotate(
                    angle: _currentAngle,
                    child: Image.asset(AppAssets.sebhaBody),
                  ),
                ),
              ],
            ),

            Center(
              child: Column(
                spacing: 12,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                Text(
                      tabs[currentIndex],
                      style: AppStyles.bold36White,
                    
                  ),
                  Text(
                    '$numberOfTasbeehs ',
                    style: AppStyles.bold36White,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
