import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../utilitis/api_services.dart';

class LoginController extends GetxController{
  final phoneController = TextEditingController();
  final passController = TextEditingController();
  var isLoading = false.obs;
  var isObscure = true.obs;

  loginWithDetails(String number,String pass) async {
               Map<String,dynamic> body={
                 ApiServices.PHONE_NUMBER:number,
                 ApiServices.PASSWORD:pass,
               };
               try{
                 var response=await http.post(Uri.parse(ApiServices.login_api_url),body: body);
                 if(response.statusCode==200){
                   print("Respnse:${response.body}");
                   var data=jsonDecode(response.body.toString());
                   var result=data['data'];

                 }
               }catch(e){
                 if (kDebugMode) {
                   print(e.toString());
                 }
               }
  }

}