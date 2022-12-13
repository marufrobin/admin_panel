import 'dart:convert';

import 'package:admin_panel/screen/bottom_nav_bar.dart';
import 'package:admin_panel/widget/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SignInPage extends StatefulWidget with ValidationMixin {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isObscureText = true;
  facthingTokenData() async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      String baseUrl = "https://apihomechef.antopolis.xyz/api/admin/";
      String signInUrl = "${baseUrl}sign-in";

      Map<String, dynamic> map = {
        'email': emailController.text.toString(),
        'password': passwordController.text.toString(),
      };

      var responce = await http.post(Uri.parse(signInUrl), body: map);
      var data = jsonDecode(responce.body);

      if (data['access_token'] != null) {
        sharedPreferences.setString("token", data['access_token']);

        print("Token:::::::::::${sharedPreferences.getString("token")}");
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => BottomNavBar(),
            ),
            (route) => false);
      } else {
        showingMsgInToast(msg: "Email or Password are incorrect.");
      }
    } catch (error) {
      print(error);
    }
  }

  // @override
  // void initState() {
  //   facthingTokenData();
  //   // TODO: implement initState
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xff3a67d8),
      // appBar: AppBar(
      //   backgroundColor: Colors.cyan,
      //   centerTitle: true,
      //   elevation: 0,
      //   title: const Text(
      //     "Sign In Page",
      //     style: TextStyle(
      //         color: Color(0xffEAEAEA),
      //         fontSize: 20,
      //         fontFamily: "Nunito",
      //         fontWeight: FontWeight.bold),
      //   ),
      // ),
      body: Stack(
        children: [
          Positioned(
            top: -360,
            left: -100,
            child: CircleAvatar(
              backgroundColor: Color(0xff1C58C9),
              radius: 300,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.width * 0.2,
            left: MediaQuery.of(context).size.width * 0.34,
            child: Image.asset(
              "images/r.png",
              scale: 4,
            ),
          ),
          SafeArea(
            child: Container(
              margin: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.30,
                        ),

                        TextFormField(
                          controller: emailController,
                          validator: (email) {
                            if (widget.isEmailValid(email!)) {
                              return null;
                            } else
                              return 'Enter a valid email address';
                          },
                          decoration: InputDecoration(
                            hintText: "Email",
                            labelText: "Email",
                            prefixIcon: Icon(Icons.email_rounded),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(24)),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        TextFormField(
                          controller: passwordController,
                          obscureText: isObscureText,
                          validator: (password) {
                            if (widget.isPasswordValid(password!))
                              return null;
                            else
                              return 'Enter a valid password';
                          },
                          decoration: InputDecoration(
                              hintText: "Password",
                              labelText: "Password",
                              prefixIcon: Icon(Icons.password_rounded),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(24)),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isObscureText = !isObscureText;
                                    setState(() {});
                                  });
                                },
                                icon: isObscureText == true
                                    ? Icon(Icons.visibility_rounded)
                                    : Icon(Icons.visibility_off_rounded),
                              )),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Container(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(24))),
                                    elevation: MaterialStateProperty.all(0),
                                    backgroundColor: MaterialStateProperty.all(
                                        const Color(0xff3a67d8))),
                                onPressed: () {
                                  // if (_formKey.currentState.validate()) {
                                  //   _formKey.currentState.save();
                                  //   // use the email provided here
                                  // }
                                  if (_formKey.currentState!.validate()) {
                                    _formKey.currentState!.save();
                                    facthingTokenData();
                                  }
                                },
                                child: const Text(
                                  "Sign In",
                                  style: TextStyle(
                                      color: Color(0xffEAEAEA),
                                      fontSize: 16,
                                      fontFamily: "Nunito",
                                      fontWeight: FontWeight.bold),
                                ))),
                        // Expanded(child: SizedBox()),
                      ]),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

mixin ValidationMixin {
  bool isPasswordValid(String password) => password.length >= 4;

  bool isEmailValid(String email) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern.toString());
    return regex.hasMatch(email);
  }
}
