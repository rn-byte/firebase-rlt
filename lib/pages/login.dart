import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_rlt/functions/auth_function.dart';
import 'package:firebase_rlt/pages/sign_up.dart';
import 'package:firebase_rlt/util/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LogIn extends StatefulWidget {
  const LogIn({
    super.key,
  });

  @override
  State<LogIn> createState() {
    return _LogInState();
  }
}

class _LogInState extends State<LogIn> {
  bool showPass = true;
  String svgPath = 'assets/icons/cl_eye.svg';
  final _formKey = GlobalKey<FormState>();
  String uEmail = '';
  String uPass = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login "),
        titleTextStyle: const TextStyle(
          fontFamily: 'Poppins',
          fontSize: 20,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Container(
          margin: const EdgeInsets.only(left: 40, right: 40),
          child: ListView(
            children: [
              const SizedBox(
                height: 200,
              ),
              TextFormField(
                decoration: formFieldDecoration(
                    hText: 'Enter Your Email',
                    lText: 'Enter Your Email',
                    icon: Icons.email_outlined),
                validator: (value) {
                  if (value.toString().isEmpty) {
                    return 'Enter email';
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  uEmail = value.toString();
                },
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                obscureText: showPass,
                decoration: formFieldDecoration(
                    hText: 'Enter Password',
                    lText: 'Enter Password',
                    icon: Icons.lock_outline,
                    suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            showPass = !showPass;
                            if (svgPath == 'assets/icons/cl_eye.svg') {
                              svgPath = 'assets/icons/op_eye.svg';
                            } else {
                              svgPath = 'assets/icons/cl_eye.svg';
                            }
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: SvgPicture.asset(
                            svgPath,
                            height: 2,
                            width: 2,
                          ),
                        ))),
                validator: (value) {
                  if (value.toString().isEmpty) {
                    return 'Enter password';
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  uPass = value.toString();
                },
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                height: 45,
                width: 200,
                child: ElevatedButton(
                    onPressed: () {
                      _logIn(uEmail, uPass);
                      // final isValid = _formKey.currentState!.validate();
                      // if (isValid) {
                      //   _formKey.currentState!.save;
                      //   signIn(uEmail, uPass);
                      // } else {
                      //   debugPrint("Error");
                      // }
                    },
                    child: const Text(
                      'Login',
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
                    'Don\'t have an Account ?',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Poppins',
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignUp(),
                            ));
                      });
                    },
                    child: const Text(' Signup',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.deepPurple,
                          decorationThickness: 1.0,
                          decorationStyle: TextDecorationStyle.solid,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        )),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _logIn(String uEmail, String uPass) async {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      _formKey.currentState!.save();

      try {
        final auth = FirebaseAuth.instance;
        await auth.signInWithEmailAndPassword(email: uEmail, password: uPass);

        debugPrint('Login successfull>>>>>>>>>>>>>');
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          debugPrint('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          debugPrint('Wrong password provided for that user.');
        }
      }
    } else {
      return 'Error';
    }
  }
}
