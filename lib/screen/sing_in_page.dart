import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
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
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextFormField(
            controller: emailController,
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
            decoration: InputDecoration(
              hintText: "Password",
              prefixIcon: Icon(Icons.password_rounded),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(24)),
            ),
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
                  onPressed: () {},
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
    );
  }
}
