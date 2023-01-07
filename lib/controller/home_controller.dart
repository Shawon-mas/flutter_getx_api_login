import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../model/user_data_list.dart';
import '../model/user_data_model.dart';
import '../utilitis/shared_prefs.dart';

class HomeController extends GetxController{
  final userDataInfo=UserInfoModel(number: '',email: '').obs;


  getUserData() async{
    SharedPrefs prefs=SharedPrefs();
    var userInfo= json.decode(await prefs.getUserData());

    userDataInfo.update((userDataInfo) {
      userDataInfo!.number= userInfo['number'];
      userDataInfo.email= userInfo['email'];
      userDataInfo.uid= userInfo['user_id'];

    });
    UserInfoModel(
      email: userInfo['email'],number: userInfo['number']
    );
    if (kDebugMode) {
      print("Home User details: $userInfo \n Home User Name: ${userInfo['name']}");
    }

  /*  var user=jsonEncode(userInfo);
    Data.fromJson(jsonEncode(userInfo))*/
    //Map<String,dynamic> map =jsonEncode(userInfo);
   // print(map.);

  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getUserData();
  }
}