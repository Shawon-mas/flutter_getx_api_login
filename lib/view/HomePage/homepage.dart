import 'package:ct_helpline/model/user_data_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controller/login_controller.dart';
import '../../utilitis/shared_prefs.dart';



class Hompage extends StatelessWidget {
 final LoginController loginController = Get.put(LoginController());
  Hompage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Homepage"),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: Center(
        child:  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Number is: ${UserDataList.token} ",
                    style: TextStyle(fontSize: 20.0, color: Colors.redAccent),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 3, left: 3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border(
                          bottom: BorderSide(color: Colors.black),
                          top: BorderSide(color: Colors.black),
                          left: BorderSide(color: Colors.black),
                          right: BorderSide(color: Colors.black),
                        )),
                    child: MaterialButton(
                      height: 50,
                      onPressed: () async{
                        SharedPrefs prefs=SharedPrefs();
                        await prefs.removeLogin();
                        print(await prefs.getIsLogin());
                      },
                      color: Colors.yellow,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      child: Text(
                        "Log Out",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                    ),
                  ),
                ],


        ),
      ),
    );
  }
}
