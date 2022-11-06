import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../HomePage/homepage.dart';
import '../controller/login_controller.dart';
import '../utilitis/utilites.dart';

class LoginScreen extends StatelessWidget {
  final _controller = Get.put(LoginController());
  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child:Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
          child: Column(
            children:<Widget> [
              Container(
                height: MediaQuery.of(context).size.height / 5,
                decoration: BoxDecoration(),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SvgPicture.asset("images/login.svg",
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children:<Widget> [
                  Text('Sign In',textAlign: TextAlign.center,style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0
                  ),),
                  SizedBox(height: 10,),
                  Text('Please login your account',style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.grey[700],
                  ),),
                ],
              ),
              SizedBox(height: 40,),
              Padding(
                padding:EdgeInsets.symmetric(horizontal: 20),
                child: Column(

                  children:<Widget> [
                    makeInput(),
                    SizedBox(height: 10,),

                  ],
                ),
              ),

              SizedBox(height: 20,),
              Padding(padding:EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  padding: EdgeInsets.only(top: 3, left: 3),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: const Border(
                        bottom: BorderSide(color: Colors.black),
                        top: BorderSide(color: Colors.black),
                        left: BorderSide(color: Colors.black),
                        right: BorderSide(color: Colors.black),
                      )
                  ),
                  child: Obx((){
                   return MaterialButton(
                      minWidth: double.infinity,
                      height: 50,
                      onPressed: () {
                        if(_controller.phoneController.text.isEmpty){
                          errorSnackBar(context, "phone fields can not be empty");
                          return;
                        }if(_controller.passController.text.isEmpty){
                          errorSnackBar(context, "pass fields can not be empty");
                          return;
                        }else{
                          _controller.loginWithDetails(_controller.phoneController.text, _controller.passController.text);
                        }
                      },
                      color: Colors.yellow,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)
                      ),
                      child: _controller.isLoading.value? Center(child: CircularProgressIndicator(),)
                          : Text("Log in"),
                    );
                  })
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
  Widget makeInput(){
    return Column(

      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget> [
        SizedBox(height: 5,),
        TextFormField(
          keyboardType: TextInputType.number,
          controller: _controller.phoneController,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.call),
               labelText: "Enter Number",
               hintText: "Enter your Number",
              contentPadding: const EdgeInsets.symmetric(vertical: 0,horizontal: 10),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.grey)
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.grey)
              )
          ),
        ),
        SizedBox(height: 20,),
        TextFormField(
          controller: _controller.passController,
          obscureText:_controller.isObscure.value,
          decoration: InputDecoration(
              prefixIcon: const Icon(Icons.lock),
              suffixIcon: Obx((){
                return IconButton(onPressed: ()
                {
                  _controller.isObscure.value=!_controller.isObscure.value;

                }, icon: Icon( _controller.isObscure.value?Icons.visibility : Icons.visibility_off,)
                );
              }),
              hoverColor: Colors.red,
              labelText: "Enter Password",
              hintText: "Enter your Password",


              contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
              enabledBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.grey)
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.grey)
              )
          ),
        ),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(

              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Forgot Password?",
                style: TextStyle(
                  shadows: [
                    Shadow(
                        color: Colors.black,
                        offset: Offset(0, -5))
                  ],
                  color: Colors.transparent,
                  decoration:
                  TextDecoration.underline,
                  decorationColor: Colors.black,
                  decorationThickness: 2,

                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
/*
void login(var num,var pass) async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    String url='https://admin.cyberteens.app/api/CC/User/Login';
    Map body={
      'number' : num,
      'password': pass
    };

    try{
      Response response=await post(
        Uri.parse(url), body: body
      );
      if(response.statusCode == 200)
        {
          print("Respnse:${response.body}");
          var data=jsonDecode(response.body.toString());
          var result=data['data'];
          if(result!=null)
          {
            setState(() {
              _isLoading=false;
            });
            //access_token
            print("Access token: ${data['access_token']}");
            Fluttertoast.showToast(
                msg: "Login Success",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 16.0
            );



       Navigator.push(context, MaterialPageRoute(builder: (context) => Hompage(
           number:number.text,
           password: password.text,

       ),),);

          }else{
            Fluttertoast.showToast(
                msg: "Login Error",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0
            );
          }

        }
    }catch(e){
      print(e.toString());
    }

  }
 */

//LoginScreen