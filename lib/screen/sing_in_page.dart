import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget with ValidationMixin {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    bool isObscureText = true;
    return Scaffold(
      // backgroundColor: Color(0xff3a67d8),
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        centerTitle: true,
        elevation: 0,
        title: const Text("Sign In Page"),
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
                prefixIcon: Icon(Icons.email_rounded),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(24)),
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
                  prefixIcon: Icon(Icons.password_rounded),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24)),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isObscureText == true
                            ? isObscureText = false
                            : isObscureText = true;
                      });
                    },
                    icon: Icon(Icons.remove_red_eye_rounded),
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
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24))),
                        elevation: MaterialStateProperty.all(0),
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xff3a67d8))),
                    onPressed: () {
                      // if (_formKey.currentState.validate()) {
                      //   _formKey.currentState.save();
                      //   // use the email provided here
                      // }
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                      }
                    },
                    child: const Text(
                      "Sign In",
                      style: TextStyle(
                          color: Color(0xffEAEAEA),
                          fontSize: 16,
                          fontFamily: "Nunito",
                          fontWeight: FontWeight.bold),
                    )))
          ]),
        ),
      ),
    );
  }
}

mixin ValidationMixin {
  bool isPasswordValid(String password) => password.length >= 6;

  bool isEmailValid(String email) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern.toString());
    return regex.hasMatch(email);
  }
}
