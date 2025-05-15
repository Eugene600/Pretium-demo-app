/*
This class is supposed to handle checking 
whether it is the user's first time
launching the application
 */
import 'package:shared_preferences/shared_preferences.dart';

class AppPreferenceService {
  Future<bool> isFirstTime() async{
    final prefs = await SharedPreferences.getInstance();
    final isFirst = prefs.getBool('is_first_time') ?? true;

    //if true, set 'is_first_time' to false
    if (isFirst) {
      await prefs.setBool('is_first_time', false);
    }

    return isFirst;
  }


  Future<void> resetFirstTime() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('is_first_time', true);
  }
}