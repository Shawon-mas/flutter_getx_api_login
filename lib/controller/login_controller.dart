import 'dart:convert';

import 'package:ct_helpline/model/user_data_model.dart';
import 'package:ct_helpline/utilitis/shared_prefs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/user_data_list.dart';
import '../utilitis/api_services.dart';
import '../view/HomePage/homepage.dart';

class LoginController extends GetxController{
  final phoneController = TextEditingController();
  final passController = TextEditingController();
  var isLoading = false.obs;
  var isObscure = true.obs;
  var isDataReadingCompleted=false.obs;

  loginWithDetails(String number,String pass) async {
        isLoading.value=true;
               Map<String,dynamic> body={
                 ApiServices.PHONE_NUMBER:number,
                 ApiServices.PASSWORD:pass,
               };
               try{
                 var response=await http.post(Uri.parse(ApiServices.login_api_url),body: body);
                 if(response.statusCode==200){

                   if (kDebugMode) {
                     print("Response:${response.body}");
                   }
                   var data=jsonDecode(response.body.toString());
                   var result=data['data'];
                   if(result!=null){
                     UserDataList.email=UserDataModel.fromJson(data).data!.email.toString();
                     UserDataList.number=UserDataModel.fromJson(data).data!.userId.toString();
                     UserDataList.token=UserDataModel.fromJson(data).accessToken!;
                    /* Data user=Data.fromJson(result);
                     await SharedPrefs().storeUser(json.encode(user));*/
                     await SharedPrefs().isLogin(true);
                     print(await SharedPrefs().getIsLogin());
                    // print(user.);
                     Get.offAll(Hompage());
                     isDataReadingCompleted.value=true;
                     isLoading.value=false;
                   }else{
                     isLoading.value=false;
                   }

                 }
               }catch(e){
                 isLoading.value=false;
                 if (kDebugMode) {
                   print(e.toString());

                 }
               }
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    phoneController.dispose();
    passController.dispose();
  }

}