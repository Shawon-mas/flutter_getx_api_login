import 'package:flutter/material.dart';


successSnackBar(BuildContext context, String text) {
  var snackBar = SnackBar(
    backgroundColor: Colors.green,
    content: Text(
      text,
      style: const TextStyle(color: Colors.white),
    ),
    duration: const Duration(seconds: 2),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

errorSnackBar(BuildContext context, String text) {
  var snackBar = SnackBar(
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.red,
    content: Text(
      text,
      style: const TextStyle(color: Colors.white),
    ),
    duration: const Duration(seconds: 2),
    margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height - 100,
        right: 20,
        left: 20),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

infoSnackBar(BuildContext context, String text) {
  var snackBar = SnackBar(
    backgroundColor: Colors.indigo,
    content: Text(
      text,
      style: const TextStyle(color: Colors.white),
    ),
    duration: const Duration(seconds: 2),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
