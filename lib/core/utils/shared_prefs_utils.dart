import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsKeys {
  static const  String key = 'surah_list'; 
}

void saveLastSurahIndex(int surahIndex)async{
  var prefs = await SharedPreferences.getInstance();
  List<String> mostRecentList = prefs.getStringList(SharedPrefsKeys.key) ?? [];

  if(mostRecentList.contains('$surahIndex')){
    mostRecentList.remove('$surahIndex');
      mostRecentList.insert(0, '$surahIndex');

  }else{
      mostRecentList.insert(0, '$surahIndex');

  }
  if(mostRecentList.length >5){
    mostRecentList.removeLast();
  }
  await prefs.setStringList(SharedPrefsKeys.key,mostRecentList );
}

Future<List<int>> getLastSurahIndex()async{
    var prefs = await SharedPreferences.getInstance();
    List<String> mostRecentIndexListAsString =  prefs.getStringList(SharedPrefsKeys.key) ?? [];

    List<int> mostRecentIndexListAsInt = mostRecentIndexListAsString.map((element) => int.parse(element)).toList();

    return mostRecentIndexListAsInt;
 
}