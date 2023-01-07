import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utilitis/shared_prefs.dart';
import 'HomePage/homepage.dart';
import 'Login/login.dart';




class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<double> _animation;
  //final GlobalCoantroller controller = Get.put(GlobalCoantroller());

  initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 3000),
        vsync: this,
        value: 0,
        lowerBound: 0,
        upperBound: 1
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn);
    _controller.forward();
    checkLogin();

  }
   checkLogin() async{
     SharedPrefs prefs=SharedPrefs();
     bool isLogin=await prefs.getIsLogin()??false;

    if( isLogin){
      Timer(Duration(seconds: 3),(){
        Get.off(Hompage());
      });
    }else{
      Timer(Duration(seconds: 3),(){
        Get.off(LoginScreen());
      });
    }
  }


  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
   // controller.checkUser();
    return Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.redAccent,
              ),
            ),
            Center(
              child: FadeTransition(
                opacity: _animation,
                child: SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Image.network('https://static.vecteezy.com/system/resources/previews/002/147/279/original/young-man-and-woman-with-headphones-microphone-and-computer-customer-service-support-or-call-center-concept-free-vector.jpg'),
                  ),
                ),
              ),
            )
          ],
        ));
  }


}
