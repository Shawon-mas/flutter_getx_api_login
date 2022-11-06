import 'package:ct_helpline/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Login/login.dart';

void main() => runApp(

     GetMaterialApp(
      initialRoute: home,
      getPages: pages,
      debugShowCheckedModeBanner: false,
    ));
