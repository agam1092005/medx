// ignore_for_file: file_names, non_constant_identifier_names, curly_braces_in_flow_control_structures, prefer_typing_uninitialized_variables, use_build_context_synchronously

import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medx/AdditionalFiles/TextForm.dart';
import 'package:medx/AdditionalFiles/constants.dart';
import 'package:medx/Pages/Prescription.dart';
import 'package:medx/Pages/Symptom.dart';
import 'BookAppointment.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ScrollController _scrollController = ScrollController();
  double _borderRadius = 0.0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_updateBorderRadius);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _updateBorderRadius() {
    setState(() {
      double progress = (_scrollController.offset - 32) / (136 - 32);

      double easedProgress = Curves.easeInOut.transform(progress.clamp(0.0, 1));

      _borderRadius = lerpDouble(0.0, 32.0, easedProgress) ?? 0.0;
    });
  }

  List symptoms = ["High Fever", "Headache", "Cough", "Fatigue"];

  TextEditingController SearchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.of(context, rootNavigator: true).push(
            CupertinoPageRoute<bool>(
              fullscreenDialog: false,
              builder: (BuildContext context) => const AddPrescription(),
            ),
          );
          HapticFeedback.selectionClick();
        },
        child: Container(
          height: 60,
          width: 160,
          decoration: const BoxDecoration(
            color: accentColor,
            borderRadius: BorderRadius.all(
              Radius.circular(
                16,
              ),
            ),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.add,
                color: Colors.white,
              ),
              Text(
                "Add Prescription",
                style: FormTextStyle2,
              )
            ],
          ),
        ),
      ),
      body: (UserData == null)
          ? const Center(
              child: Text("Loading Content"),
            )
          : Column(
              children: [
                Container(
                  width: double.maxFinite,
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, bottom: 16, top: 60),
                  decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(_borderRadius),
                      bottomLeft: Radius.circular(_borderRadius),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Hello',
                                  style: FormTextStyle,
                                ),
                                TextSpan(
                                  text: ',',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: accentColor,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Text(
                            "Hope you are doing well",
                            style: FormTextStyle,
                          ),
                          Text(
                            "Mr. ${UserData['name'].toString().split(" ")[0]}",
                            style: SubHeadingTextStyle,
                          ),
                        ],
                      ),
                      CircleAvatar(
                        backgroundColor: secondaryColor,
                        backgroundImage:
                            NetworkImage(UserData['picture'].toString()),
                        radius: 25,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    physics: const ClampingScrollPhysics(),
                    controller: _scrollController,
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    children: [
                      Container(
                        width: double.maxFinite,
                        padding: const EdgeInsets.only(
                            left: 16, right: 16, bottom: 36, top: 0),
                        decoration: const BoxDecoration(
                          color: bgColor,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(
                              32,
                            ),
                            bottomRight: Radius.circular(
                              32,
                            ),
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.width * 0.15,
                              width: MediaQuery.of(context).size.width * 0.75,
                              alignment: Alignment.center,
                              child: TextForm(
                                hintText: "Search Symptom",
                                color: accentColor,
                                controller: SearchController,
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {
                                if (SearchController.text.isNotEmpty) {
                                  Navigator.of(context, rootNavigator: true)
                                      .push(
                                    CupertinoPageRoute<bool>(
                                      fullscreenDialog: false,
                                      builder: (BuildContext context) =>
                                          Symptom(
                                        title: SearchController.text,
                                      ),
                                    ),
                                  );
                                }
                              },
                              child: CircleAvatar(
                                radius:
                                    MediaQuery.of(context).size.width * 0.07,
                                backgroundColor: accentColor,
                                child: const Icon(
                                  Icons.search,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          "Your Symptoms ?",
                          style: AppbarTextStyle,
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        width: double.maxFinite,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.zero,
                          physics: const BouncingScrollPhysics(),
                          itemCount: symptoms.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context, rootNavigator: true).push(
                                  CupertinoPageRoute<bool>(
                                    fullscreenDialog: false,
                                    builder: (BuildContext context) => Symptom(
                                      title: symptoms[index].toString(),
                                    ),
                                  ),
                                );
                                HapticFeedback.selectionClick();
                              },
                              child: Container(
                                margin:
                                    const EdgeInsets.only(left: 12, right: 4),
                                padding: const EdgeInsets.all(8),
                                constraints:
                                    const BoxConstraints(minWidth: 130),
                                decoration: const BoxDecoration(
                                  color: accentColor,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      12,
                                    ),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    symptoms[index].toString(),
                                    style: ButtonTextStyle,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Nearby Doctors",
                              style: AppbarTextStyle,
                            ),
                            SizedBox(
                              height: 200,
                              width: double.maxFinite,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                padding: EdgeInsets.zero,
                                physics: const BouncingScrollPhysics(),
                                itemCount: doctors.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () async {
                                      Navigator.of(context, rootNavigator: true)
                                          .push(
                                        CupertinoPageRoute<bool>(
                                          fullscreenDialog: false,
                                          builder: (BuildContext context) =>
                                              BookAppointment(
                                                averageAppointmentTime: doctors[index]['averageAppointmentTime'],
                                                type: doctors[index]['appointmentType'],
                                            doctorID: doctors[index]['_id'],
                                            doctor: doctors[index]['name'],
                                            hospital: doctors[index]
                                                ['hospitalName'],
                                            DocImage: "assets/doctor.png",
                                            desc: doctors[index]['description'],
                                                queueNumber: doctors[index]['currentQueueNumber'],
                                          ),
                                        ),
                                      );
                                      HapticFeedback.selectionClick();
                                    },
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(
                                              left: 0, right: 16),
                                          padding:
                                              const EdgeInsets.only(top: 16),
                                          width: 150,
                                          height: 150,
                                          decoration: const BoxDecoration(
                                            color: bgColor,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(
                                                16,
                                              ),
                                            ),
                                          ),
                                          child: const Image(
                                            image:
                                                AssetImage("assets/doctor.png"),
                                            fit: BoxFit.fitHeight,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 12, right: 4, top: 4),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                doctors[index]['name'],
                                                style: FormTextStyle,
                                              ),
                                              Text(
                                                doctors[index]['hospitalName'],
                                                style: SubFormTextStyle,
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Container(
                      //   width: double.maxFinite,
                      //   decoration: const BoxDecoration(
                      //     color: bgColor,
                      //     borderRadius: BorderRadius.all(
                      //       Radius.circular(
                      //         12,
                      //       ),
                      //     ),
                      //   ),
                      //   margin: const EdgeInsets.symmetric(horizontal: 16),
                      //   padding: const EdgeInsets.all(16),
                      //   child: const Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       Text(
                      //         "Your Medical History",
                      //         style: AppbarTextStyle,
                      //       ),
                      //       Text(
                      //         "Lorem llum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                      //         style: TextFormTextStyle,
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
