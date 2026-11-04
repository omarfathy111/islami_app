import 'package:flutter/foundation.dart';
import 'package:islami_app/core/utils/shared_prefs_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MostRecentListProvider extends ChangeNotifier {
    List<int> mostRecentList = [];

    
void getLastSurahIndex()async{
    var prefs = await SharedPreferences.getInstance();
    List<String> mostRecentIndexListAsString =  prefs.getStringList(SharedPrefsKeys.key) ?? [];

    mostRecentList= mostRecentIndexListAsString.map((element) => int.parse(element)).toList();

    notifyListeners(); // بيبعت notfication بيقول ان الداتا اتغيرت
 
}

}