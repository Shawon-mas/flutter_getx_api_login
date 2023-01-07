import 'package:get/get.dart';

import '../utilitis/shared_prefs.dart';
import '../view/HomePage/homepage.dart';
import '../view/Login/login.dart';

class GlobalController extends GetxController {
  //var user = SharedPrefs().getUser();

  checkUser() async {
    Future.delayed(const Duration(milliseconds: 3000), () {
      Get.to(LoginScreen());
    });

  }
  @override
  void onInit() {
    // TODO: implement onInit
    checkUser();
    super.onInit();
  }
}