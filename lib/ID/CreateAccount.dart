// // ignore_for_file: file_names, non_constant_identifier_names
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:medx/AdditionalFiles/TextForm.dart';
// import 'package:medx/HomePage.dart';
// import '../AdditionalFiles/constants.dart';
// import '../AdditionalFiles/rounded_button.dart';
// import 'Login.dart';
//
// class CreateAccount extends StatefulWidget {
//   const CreateAccount({super.key});
//
//   @override
//   State<CreateAccount> createState() => _CreateAccountState();
// }
//
// class _CreateAccountState extends State<CreateAccount> {
//
//   bool passwordVisibility = false;
//   @override
//   Widget build(BuildContext context) {
//     TextEditingController RollnumberController = TextEditingController();
//     TextEditingController PasswordController = TextEditingController();
//     TextEditingController EmailController = TextEditingController();
//     return Scaffold(
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Spacer(),
//               const Text(
//                 "MedX",
//                 style: HeadingTextStyle,
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               const Text(
//                 "Welcome",
//                 style: SubHeadingTextStyle,
//               ),
//               const Text(
//                 "Please fill the details to create an account",
//                 style: FormTextStyle,
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               TextForm(
//                 hintText: "Enter Roll number",
//                 color: Colors.black38,
//                 controller: RollnumberController,
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               TextForm(
//                 hintText: "Enter Email ID",
//                 controller: EmailController,
//                 color: Colors.black38,
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               TextForm(
//                 hintText: "Create Password",
//                 color: Colors.black38,
//                 controller: PasswordController,
//                 icon: GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       passwordVisibility = !passwordVisibility;
//                     });
//                   },
//                   child: Icon(
//                     (passwordVisibility) ? Icons.visibility_outlined : Icons.visibility_off_outlined,
//                     color: Colors.black38,
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               RoundedButton(
//                 onPressed: () {
//                   Navigator.of(context, rootNavigator: true).push(
//                     CupertinoPageRoute<bool>(
//                       fullscreenDialog: false,
//                       builder: (BuildContext context) =>
//                       const HomePage(),
//                     ),
//                   );
//                   HapticFeedback.selectionClick();
//                 },
//                 height: 50,
//                 width: double.maxFinite,
//                 child: const Text(
//                   "Sign In",
//                   style: ButtonTextStyle,
//                 ),
//               ),
//               const Spacer(),
//               Center(
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Text("Having an Account? "),
//                     TextButton(
//                       onPressed: () {
//                         Navigator.of(context, rootNavigator: true).pushReplacement(
//                           CupertinoPageRoute<bool>(
//                             fullscreenDialog: false,
//                             builder: (BuildContext context) =>
//                             const Login(),
//                           ),
//                         );
//                         HapticFeedback.selectionClick();
//                       },
//                       child: const Text(
//                         "Log In",
//                         style: TextStyle(
//                           decoration: TextDecoration.underline,
//                           color: accentColor,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
