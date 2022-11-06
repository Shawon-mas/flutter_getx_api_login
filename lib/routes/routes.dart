

import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import '../Login/login.dart';

const home = "/";

//const otp = "/otp";

final pages = [
  page(home, LoginScreen()),

  //page(completeYourProfile, CompleteProfileScreen()),
  //page(otp, OtpScreen(),),
];

GetPage page(String name, Widget page) {
  return GetPage(
    name: name,
    page: () => page,
    transition: Transition.cupertino,
  );
}
