import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

String baseUrl = "https://apihomechef.antopolis.xyz/api/admin/";

showingMsgInToast({required String msg}) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}

TextStyle buildTextStyle(double fntSize, Color clr, FontWeight fontWeight) {
  return TextStyle(
      color: clr,
      fontSize: fntSize,
      fontFamily: "Nunito",
      fontWeight: fontWeight);
}
