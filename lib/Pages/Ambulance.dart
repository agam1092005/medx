// ignore_for_file: file_names

import 'dart:ui';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medx/AdditionalFiles/constants.dart';
import 'package:medx/AdditionalFiles/rounded_button.dart';

class Ambulance extends StatefulWidget {
  const Ambulance({super.key});

  @override
  State<Ambulance> createState() => _AmbulanceState();
}

class _AmbulanceState extends State<Ambulance> {
  CountDownController CountdownController = CountDownController();
  var EmergencyText = "Call only in case of emergency";
  var secondaryText = "Check symptoms & contact, Don't panic";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: Padding(
      //   padding: const EdgeInsets.all(16),
      //   child: RoundedButton(
      //     color: secondaryColor,
      //     onPressed: () {
      //       Navigator.pop(context);
      //       HapticFeedback.selectionClick();
      //     },
      //     height: 50,
      //     width: double.maxFinite,
      //     child: const Text(
      //       "Okay",
      //       style: ButtonTextStyle,
      //     ),
      //   ),
      // ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 150,
                    backgroundColor: Colors.red.withOpacity(0.05),
                    child: CircleAvatar(
                      radius: 125,
                      backgroundColor: Colors.red.withOpacity(0.075),
                      child: CircleAvatar(
                        radius: 100,
                        backgroundColor: Colors.red.withOpacity(0.1),
                        child: CircleAvatar(
                          radius: 75,
                          backgroundColor: Colors.red.withOpacity(0.15),
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return BackdropFilter(
                                        filter: ImageFilter.blur(
                                            sigmaX: 5, sigmaY: 5),
                                        child: Dialog(
                                          backgroundColor: Colors.transparent,
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.5,
                                            width: double.maxFinite,
                                            padding: const EdgeInsets.all(16),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(32),
                                            ),
                                            child: Column(
                                              children: [
                                                const Icon(
                                                  Icons.emergency_outlined,
                                                  color: Colors.red,
                                                  size: 30,
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                const Text(
                                                  "Agam, are you okay ?",
                                                  style: SubHeadingTextStyle,
                                                ),
                                                const Text(
                                                  "We are going to call ambulance in 10 seconds",
                                                  style: TextFormTextStyle,
                                                  textAlign: TextAlign.center,
                                                ),
                                                const Spacer(),
                                                CircularCountDownTimer(
                                                  controller:
                                                      CountdownController,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      3,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      3,
                                                  textStyle:
                                                      SubHeadingTextStyle,
                                                  duration: 10,
                                                  autoStart: true,
                                                  isReverse: true,
                                                  isReverseAnimation: true,
                                                  fillColor: secondaryColor,
                                                  ringColor: bgColor,
                                                  strokeWidth: 10.0,
                                                  strokeCap: StrokeCap.round,
                                                  onComplete: () {
                                                    Navigator.pop(context);
                                                    setState(() {
                                                      EmergencyText =
                                                          "Ambulance is on its way !";
                                                      secondaryText =
                                                          "Agam, breathe slowly and deeply to lower your heart rate";
                                                    });
                                                    HapticFeedback.vibrate();
                                                  },
                                                ),
                                                const Spacer(),
                                                RoundedButton(
                                                  color: secondaryColor,
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  width: double.maxFinite,
                                                  height: 50,
                                                  child: const Text(
                                                    "Cancel ambulance",
                                                    style: ButtonTextStyle,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    });
                              },
                              child: const Text(
                                "SOS",
                                style: SubHeadingTextStyle2,
                              ),
                            ),
                          ),
                          // child: Container(
                          //   margin: const EdgeInsets.all(8),
                          //   decoration: const BoxDecoration(
                          //     color: Colors.transparent,
                          //     image: DecorationImage(
                          //       image: AssetImage(
                          //         "assets/ambulance.png",
                          //       ),
                          //     ),
                          //   ),
                          // ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            Text(
              EmergencyText,
              style: SubHeadingTextStyle,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              secondaryText,
              style: TextFormTextStyle,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
