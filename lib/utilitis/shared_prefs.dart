import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs{


 isLogin(value) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLogin', value);

  }
  getIsLogin() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLogin');
  }
   removeLogin() async{
     SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.remove('isLogin');
   }

}