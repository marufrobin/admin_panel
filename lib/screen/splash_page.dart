import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff3a67d8),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text("Splash page"),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Text(
              "Wellcome to My App",
              style: TextStyle(
                color: Color(0xffEAEAEA),
                fontSize: 36,
                fontFamily: "Nunito",
              ),
            ),
          ),
          Expanded(
              flex: 4,
              child: Image.asset(
                "images/r.png",
                scale: 2,
              )),
          Expanded(flex: 2, child: Placeholder())
        ],
      ),
    );
  }
}
