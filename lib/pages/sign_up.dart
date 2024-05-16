import 'package:firebase_rlt/functions/auth_function.dart';
import 'package:firebase_rlt/pages/login.dart';
import 'package:firebase_rlt/util/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() {
    return _SignUpState();
  }
}

class _SignUpState extends State<SignUp> {
  bool showText = true;
  String svgPath = 'assets/icons/cl_eye.svg';
  bool showText2 = true;
  String svgPath2 = 'assets/icons/cl_eye.svg';
  final _formKey = GlobalKey<FormState>();
  String fName = '';
  String lName = '';
  String uEmail = '';
  String uPhone = '';
  String uPass = '';
  String urPass = '';

  var uPassController = TextEditingController();
  var urPassController = TextEditingController();
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
      body: _signupSection(context),
    );
  }

  Form _signupSection(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        margin: const EdgeInsets.only(left: 40, right: 40, bottom: 20),
        child: ListView(
          children: [
            const SizedBox(
              height: 100,
            ),
            TextFormField(
              decoration: formFieldDecoration(
                  hText: 'First Name',
                  lText: 'First Name',
                  icon: Icons.person_outline),
              validator: (value) {
                if (value.toString().isEmpty) {
                  return 'First Name Should not be Empty';
                } else {
                  return null;
                }
              },
              onSaved: (value) {
                fName = value.toString();
              },
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              decoration: formFieldDecoration(
                  hText: 'Last Name',
                  lText: 'Last Name',
                  icon: Icons.title_outlined),
              validator: (value) {
                if (value.toString().isEmpty) {
                  return 'Last Name Should not be Empty';
                } else {
                  return null;
                }
              },
              onSaved: (value) {
                lName = value.toString();
              },
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              decoration: formFieldDecoration(
                  hText: 'Enter Phone Number',
                  lText: 'Enter Phone Number',
                  icon: Icons.phone_outlined),
              validator: (value) {
                if (value.toString().isEmpty) {
                  return 'Phone Number Should not be Empty';
                } else {
                  return null;
                }
              },
              onSaved: (value) {
                uPhone = value.toString();
              },
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              decoration: formFieldDecoration(
                  hText: 'Enter Your Email',
                  lText: 'Enter Your Email',
                  icon: Icons.email_outlined),
              validator: (value) {
                if (value.toString().isEmpty) {
                  return 'Email Should not be Empty';
                } else if (!(value.toString().contains(RegExp(
                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")))) {
                  return 'Invalid Email';
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
              controller: uPassController,
              obscureText: showText,
              decoration: formFieldDecoration(
                  hText: 'Enter Password',
                  lText: 'Enter Password',
                  icon: Icons.lock_outline,
                  suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          showText = !showText;
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
                  return 'Password Field should be Empty';
                } else if (value.toString().length < 6) {
                  return 'Password Length Should be Greater Than 6';
                } else {
                  print(uPass);
                  return null;
                }
              },
              onSaved: (value) {
                uPass = value.toString();
              },
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
                controller: urPassController,
                obscureText: showText2,
                decoration: formFieldDecoration(
                    hText: 'Re-type Password',
                    lText: 'Re-type Password',
                    icon: Icons.lock_outline,
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          showText2 = !showText2;
                          if (svgPath2 == 'assets/icons/cl_eye.svg') {
                            svgPath2 = 'assets/icons/op_eye.svg';
                          } else {
                            svgPath2 = 'assets/icons/cl_eye.svg';
                          }
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: SvgPicture.asset(
                          svgPath2,
                          height: 2,
                          width: 2,
                        ),
                      ),
                    )),
                validator: (value) {
                  if (value.toString().isEmpty) {
                    return 'Password Field should be Empty';
                  } else if (value.toString() == uPass) {
                    return 'Password mis-match';
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  urPass = value.toString();
                }),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              height: 45,
              width: 200,
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _trySubmit();
                      signUp(uEmail, uPass);
                    });
                  },
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
                      Navigator.pushReplacement(
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

  _trySubmit() {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      _formKey.currentState!.save();
    } else {
      return 'Error';
    }
  }
}
