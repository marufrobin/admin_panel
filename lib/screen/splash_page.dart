import 'dart:async';

import 'package:admin_panel/screen/bottom_nav_bar.dart';
import 'package:admin_panel/screen/welcome.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  isLogin() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    if (sharedPreferences.getString("tokan") == null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => WellcomePage(),
          ),
          (route) => false);
    } else {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => BottomNavBar(),
          ),
          (route) => false);
    }
  }

  @override
  void initState() {
    Timer(Duration(seconds: 2), () {
      isLogin();
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff3a67d8),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "images/dokanlogo.png",
            ),
            LoadingAnimationWidget.dotsTriangle(
              color: Colors.white,
              size: 60,
            ),
          ],
        ),
      ),
    );
  }
}
