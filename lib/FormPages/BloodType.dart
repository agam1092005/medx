// ignore_for_file: prefer_typing_uninitialized_variables, use_build_context_synchronously

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keychain/flutter_keychain.dart';
import 'package:medx/AdditionalFiles/constants.dart';
import 'package:medx/AdditionalFiles/rounded_button.dart';
import 'package:medx/HomePage.dart';
import 'package:medx/utils.dart';

class BloodType extends StatefulWidget {
  final gender;
  final height;
  final weight;
  final dob;
  final eName;
  final ePhone;
  final eRelation;
  const BloodType(
      {super.key,
      required this.gender,
      required this.height,
      required this.weight,
      required this.dob, required this.eName, required this.ePhone, required this.eRelation});

  @override
  State<BloodType> createState() => _BloodTypeState();
}

class _BloodTypeState extends State<BloodType> {
  var BloodType;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            const Icon(
              Icons.bloodtype_outlined,
              color: Colors.red,
              size: 50,
            ),
            const Text(
              "One last detail,",
              style: SubHeadingTextStyle,
            ),
            const Text(
              "Your Blood Group ",
              style: TaglinesTextStyle,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      BloodType = "O+";
                    });
                  },
                  child: Container(
                    height: (MediaQuery.of(context).size.width / 4),
                    width: (MediaQuery.of(context).size.width / 2) - 32,
                    decoration: BoxDecoration(
                      color: (BloodType == "O+") ? secondaryColor : bgColor,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(
                          16,
                        ),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'O',
                          style: (BloodType == "O+")
                              ? SubHeadingTextStyle2
                              : SubHeadingTextStyle,
                        ),
                        Text(
                          'Positive',
                          style: (BloodType == "O+")
                              ? ButtonTextStyle
                              : ButtonTextStyle2,
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      BloodType = "O-";
                    });
                  },
                  child: Container(
                    height: (MediaQuery.of(context).size.width / 4),
                    width: (MediaQuery.of(context).size.width / 2) - 32,
                    decoration: BoxDecoration(
                      color: (BloodType == "O-") ? secondaryColor : bgColor,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(
                          16,
                        ),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'O',
                          style: (BloodType == "O-")
                              ? SubHeadingTextStyle2
                              : SubHeadingTextStyle,
                        ),
                        Text(
                          'Negative',
                          style: (BloodType == "O-")
                              ? ButtonTextStyle
                              : ButtonTextStyle2,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      BloodType = "A+";
                    });
                  },
                  child: Container(
                    height: (MediaQuery.of(context).size.width / 4),
                    width: (MediaQuery.of(context).size.width / 2) - 32,
                    decoration: BoxDecoration(
                      color: (BloodType == "A+") ? secondaryColor : bgColor,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(
                          16,
                        ),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'A',
                          style: (BloodType == "A+")
                              ? SubHeadingTextStyle2
                              : SubHeadingTextStyle,
                        ),
                        Text(
                          'Positive',
                          style: (BloodType == "A+")
                              ? ButtonTextStyle
                              : ButtonTextStyle2,
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      BloodType = "A-";
                    });
                  },
                  child: Container(
                    height: (MediaQuery.of(context).size.width / 4),
                    width: (MediaQuery.of(context).size.width / 2) - 32,
                    decoration: BoxDecoration(
                      color: (BloodType == "A-") ? secondaryColor : bgColor,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(
                          16,
                        ),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'A',
                          style: (BloodType == "A-")
                              ? SubHeadingTextStyle2
                              : SubHeadingTextStyle,
                        ),
                        Text(
                          'Negative',
                          style: (BloodType == "A-")
                              ? ButtonTextStyle
                              : ButtonTextStyle2,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      BloodType = "B+";
                    });
                  },
                  child: Container(
                    height: (MediaQuery.of(context).size.width / 4),
                    width: (MediaQuery.of(context).size.width / 2) - 32,
                    decoration: BoxDecoration(
                      color: (BloodType == "B+") ? secondaryColor : bgColor,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(
                          16,
                        ),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'B',
                          style: (BloodType == "B+")
                              ? SubHeadingTextStyle2
                              : SubHeadingTextStyle,
                        ),
                        Text(
                          'Positive',
                          style: (BloodType == "B+")
                              ? ButtonTextStyle
                              : ButtonTextStyle2,
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      BloodType = "B-";
                    });
                  },
                  child: Container(
                    height: (MediaQuery.of(context).size.width / 4),
                    width: (MediaQuery.of(context).size.width / 2) - 32,
                    decoration: BoxDecoration(
                      color: (BloodType == "B-") ? secondaryColor : bgColor,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(
                          16,
                        ),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'B',
                          style: (BloodType == "B-")
                              ? SubHeadingTextStyle2
                              : SubHeadingTextStyle,
                        ),
                        Text(
                          'Negative',
                          style: (BloodType == "B-")
                              ? ButtonTextStyle
                              : ButtonTextStyle2,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      BloodType = "AB+";
                    });
                  },
                  child: Container(
                    height: (MediaQuery.of(context).size.width / 4),
                    width: (MediaQuery.of(context).size.width / 2) - 32,
                    decoration: BoxDecoration(
                      color: (BloodType == "AB+") ? secondaryColor : bgColor,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(
                          16,
                        ),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AB',
                          style: (BloodType == "AB+")
                              ? SubHeadingTextStyle2
                              : SubHeadingTextStyle,
                        ),
                        Text(
                          'Positive',
                          style: (BloodType == "AB+")
                              ? ButtonTextStyle
                              : ButtonTextStyle2,
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      BloodType = "AB-";
                    });
                  },
                  child: Container(
                    height: (MediaQuery.of(context).size.width / 4),
                    width: (MediaQuery.of(context).size.width / 2) - 32,
                    decoration: BoxDecoration(
                      color: (BloodType == "AB-") ? secondaryColor : bgColor,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(
                          16,
                        ),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AB',
                          style: (BloodType == "AB-")
                              ? SubHeadingTextStyle2
                              : SubHeadingTextStyle,
                        ),
                        Text(
                          'Positive',
                          style: (BloodType == "AB-")
                              ? ButtonTextStyle
                              : ButtonTextStyle2,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            RoundedButton(
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
                var response = await SendUserDetails(
                  BloodType.toString(),
                  widget.dob.toString(),
                  widget.gender.toString(),
                  double.parse(widget.height),
                  double.parse(widget.weight),
                  widget.eName,
                  widget.ePhone,
                  widget.eRelation,
                );
                if (response[0] == 200 || response[0] == 201) {
                  await getUserData();
                  await getDoctors();
                  await FlutterKeychain.put(key: "completedProfile", value: "True");
                  Navigator.pop(context);
                  Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
                    CupertinoPageRoute<bool>(
                      fullscreenDialog: false,
                      builder: (BuildContext context) => const HomePage(),
                    ),
                    (Route<dynamic> route) => false,
                  );
                }
                else {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Something went wrong",),),);
                }
              },
              height: 50,
              width: double.maxFinite,
              color: secondaryColor,
              child: const Center(
                child: Text(
                  "Submit",
                  style: ButtonTextStyle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
