import 'package:firebase_rlt/pages/login.dart';
import 'package:firebase_rlt/util/text_form_field.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() {
    return _SignUpState();
  }
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
        titleTextStyle: const TextStyle(
          fontFamily: 'Poppins',
          fontSize: 20,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(40),
        child: ListView(
          children: [
            const SizedBox(
              height: 100,
            ),
            TextFormField(
              decoration: formFieldDecoration(
                  hText: 'First Name', lText: 'First Name', icon: Icons.person),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              decoration: formFieldDecoration(
                  hText: 'Last Name', lText: 'Last Name', icon: Icons.person),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              decoration: formFieldDecoration(
                  hText: 'Enter Phone Number',
                  lText: 'Enter Phone Number',
                  icon: Icons.phone),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              decoration: formFieldDecoration(
                  hText: 'Enter Your Email',
                  lText: 'Enter Your Email',
                  icon: Icons.email_rounded),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              obscureText: true,
              decoration: formFieldDecoration(
                  hText: 'Enter Password',
                  lText: 'Enter Password',
                  icon: Icons.password,
                  suffixIcon: Icons.no_encryption),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              obscureText: true,
              decoration: formFieldDecoration(
                  hText: 'Re-type Password',
                  lText: 'Re-type Password',
                  icon: Icons.password,
                  suffixIcon: Icons.no_encryption),
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              height: 45,
              width: 200,
              child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'Signup',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(
                  'Already have an Account ?',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Poppins',
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LogIn(),
                          ));
                    });
                  },
                  child: const Text(
                    ' Login',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.deepPurple,
                        decorationThickness: 1.0,
                        decorationStyle: TextDecorationStyle.solid,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
