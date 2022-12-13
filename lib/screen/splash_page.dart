import 'package:admin_panel/screen/sing_in_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff3a67d8),
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   centerTitle: true,
      //   title: Text("Splash page"),
      // ),
      body: Column(
        children: [
          const Expanded(
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
                "images/dokanlogo.png",
              )),
          ElevatedButton(
            style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                backgroundColor: MaterialStateProperty.all(Color(0xffEAEAEA)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24)))),
            onPressed: () {},
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.36,
                  vertical: MediaQuery.of(context).size.height * 0.02),
              child: const Text(
                "SIGN UP",
                style: TextStyle(
                    color: Color(0xff0B23AC),
                    fontSize: 16,
                    fontFamily: "Nunito",
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            "Already a Member?",
            style: TextStyle(
              fontSize: 16,
              fontFamily: "Nunito",
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignInPage(),
                  ));
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.376,
                  vertical: MediaQuery.of(context).size.height * 0.02),
              child: const Text(
                "Sign In",
                style: TextStyle(
                    color: Color(0xffEAEAEA),
                    fontSize: 16,
                    fontFamily: "Nunito",
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
