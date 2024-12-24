// ignore_for_file: file_names, non_constant_identifier_names, use_build_context_synchronously

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keychain/flutter_keychain.dart';
import 'package:medx/FormPages/MoodPage.dart';
import '../AdditionalFiles/constants.dart';
import '../HomePage.dart';
import '../utils.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          showDialog(
              context: context,
              builder: (context) {
                return BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 2,
                    sigmaY: 2,
                  ),
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: secondaryColor,
                    ),
                  ),
                );
              });
          var token = await Glogin();
          var response = await VerifyUser(token);
          if (response[0] == 200 || response[0] == 201) {
            await FlutterKeychain.put(
                key: "jwt", value: response[1]['authtoken']);
            await getUserData();
            await getDoctors();
            if (response[1]['newUser']) {
              await FlutterKeychain.put(
                  key: "completedProfile", value: "False");
            }
            Navigator.pop(context);
            Navigator.of(context, rootNavigator: true).pushReplacement(
              CupertinoPageRoute<bool>(
                fullscreenDialog: false,
                builder: (BuildContext context) => (response[1]['newUser'])
                    ? const MoodPage()
                    : const HomePage(),
              ),
            );
          } else {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  "Something went wrong",
                ),
              ),
            );
          }
        },
        backgroundColor: Colors.white,
        child: const Image(
          image: AssetImage(
            'assets/google.png',
          ),
          width: 35,
        ),
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Text(
                "MedX",
                style: HeadingTextStyle,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Welcome",
                style: SubHeadingTextStyle,
              ),
              SizedBox(
                height: 20,
              ),
              Image(
                image: AssetImage(
                  "assets/login.png",
                ),
                width: 300,
              ),

              // const SizedBox(
              //   height: 20,
              // ),
              // TextForm(
              //   hintText: "Enter Roll number",
              //   color: Colors.black38,
              //   controller: RollnumberController,
              // ),
              // const SizedBox(
              //   height: 20,
              // ),
              // TextForm(
              //   hintText: "Create Password",
              //   color: Colors.black38,
              //   controller: PasswordController,
              //   icon: GestureDetector(
              //     onTap: () {
              //       setState(() {
              //         passwordVisibility = !passwordVisibility;
              //       });
              //     },
              //     child: Icon(
              //       (passwordVisibility) ? Icons.visibility_outlined : Icons.visibility_off_outlined,
              //             color: Colors.black38,
              //           ),
              //   ),
              // ),
              // const SizedBox(
              //   height: 10,
              // ),
              // Align(
              //   alignment: Alignment.topRight,
              //   child: TextButton(
              //     onPressed: () {},
              //     child: const Text(
              //       "Forget Password?",
              //       style: TextStyle(
              //         decoration: TextDecoration.underline,
              //         color: accentColor,
              //       ),
              //     ),
              //   ),
              // ),
              // const SizedBox(
              //   height: 20,
              // ),
              // RoundedButton(
              //   onPressed: () {
              //     Navigator.of(context, rootNavigator: true).push(
              //       CupertinoPageRoute<bool>(
              //         fullscreenDialog: false,
              //         builder: (BuildContext context) =>
              //         const HomePage(),
              //       ),
              //     );
              //     HapticFeedback.selectionClick();
              //   },
              //   height: 50,
              //   width: double.maxFinite,
              //   child: const Text(
              //     "Log In",
              //     style: ButtonTextStyle,
              //   ),
              // ),
              // const Spacer(),
              // Center(
              //   child: Row(
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       const Text("Don't have an Account? "),
              //       TextButton(
              //         onPressed: () {
              //           Navigator.of(context, rootNavigator: true)
              //               .pushReplacement(
              //             CupertinoPageRoute<bool>(
              //               fullscreenDialog: false,
              //               builder: (BuildContext context) =>
              //                   const CreateAccount(),
              //             ),
              //           );
              //           HapticFeedback.selectionClick();
              //         },
              //         child: const Text(
              //           "Create Account",
              //           style: TextStyle(
              //             decoration: TextDecoration.underline,
              //             color: accentColor,
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // const SizedBox(
              //   height: 20,
              // ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(right: 65, bottom: 10),
                child: Text(
                  'By creating account, you are agreeing to our terms & conditions as well as privacy policy.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black38,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
