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

   storeUserData(user) async{
     SharedPreferences prefs = await SharedPreferences.getInstance();
     prefs.setString('user_info', user);
   }

   getUserData()  async{
     SharedPreferences prefs = await SharedPreferences.getInstance();
     return prefs.getString('user_info');
   }

   removeUserData()  async{
   SharedPreferences prefs = await SharedPreferences.getInstance();
   return prefs.remove('user_info');

 }

}