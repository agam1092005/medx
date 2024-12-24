// ignore_for_file: prefer_typing_uninitialized_variables, use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../AdditionalFiles/constants.dart';
import '../utils.dart';
import 'BookAppointment.dart';

class Symptom extends StatefulWidget {
  final title;
  const Symptom({super.key, required this.title});

  @override
  State<Symptom> createState() => _SymptomState();
}

class _SymptomState extends State<Symptom> {
  var search;

  callSearch() async {
    var response = await SearchSymptoms(
        widget.title);
    setState(() {
      search = response[1];
    });
  }

  @override
  void initState() {
    super.initState();
    callSearch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (search == null) ? const Center(child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            color: accentColor,
          ),
          SizedBox(
            height: 20,
          ),
          Text("Searching your symptoms...", style: FormTextStyle,),
        ],
      ),) : Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 60),
        child: Column(
          children: [
            Text(
              "Search results for ${widget.title}",
              style: AppbarTextStyle,
            ),
            const SizedBox(
              height: 20,
            ),
            (search['recommendations'].length == 1)
                ? Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: const BoxDecoration(
                      color: bgColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          12,
                        ),
                      ),
                    ),
                    width: double.maxFinite,
                    child: Center(
                      child: Text(
                        search['recommendations'].toString().substring(
                            1,
                            search['recommendations'].toString().length -
                                1),
                        style: FormTextStyle,
                      ),
                    ),
                  )
                : Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: const BoxDecoration(
                      color: bgColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          12,
                        ),
                      ),
                    ),
                    height: 45 *
                        double.parse(
                            search['recommendations'].length.toString()),
                    width: double.maxFinite,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Tips:",
                          style: AppbarTextStyle,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.vertical,
                            itemCount: search['recommendations'].length,
                            itemBuilder: (BuildContext context, int index) {
                              return Text(
                                "• ${search['recommendations'][index]}",
                                style: FormTextStyle,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
            const SizedBox(
              height: 20,
            ),
            (search['suggestedDoctors'].length == 0)
                ? const Text(
                    "No suggested doctors found",
                    style: AppbarTextStyle,
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Suggested Doctors",
                        style: AppbarTextStyle,
                      ),
                      SizedBox(
                        height: 200,
                        width: double.maxFinite,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.zero,
                          physics: const BouncingScrollPhysics(),
                          itemCount: search['suggestedDoctors'].length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () async {
                                Navigator.of(context, rootNavigator: true).push(
                                  CupertinoPageRoute<bool>(
                                    fullscreenDialog: false,
                                    builder: (BuildContext context) =>
                                        BookAppointment(
                                          averageAppointmentTime: search['suggestedDoctors']
                                          [index]['averageAppointmentTime'],
                                          type: search['suggestedDoctors']
                                          [index]['appointmentType'],
                                      doctorID:
                                          search['suggestedDoctors']
                                              [index]['_id'],
                                      doctor: search['suggestedDoctors']
                                          [index]['name'],
                                      hospital:
                                          search['suggestedDoctors']
                                              [index]['hospitalName'],
                                      DocImage: "assets/doctor.png",
                                      desc: search['suggestedDoctors']
                                          [index]['description'],
                                          queueNumber: search['suggestedDoctors']
                                          [index]['currentQueueNumber'],
                                    ),
                                  ),
                                );
                                HapticFeedback.selectionClick();
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                        left: 0, right: 16),
                                    padding: const EdgeInsets.only(top: 16),
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
                                      image: AssetImage("assets/doctor.png"),
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
                                          search['suggestedDoctors']
                                              [index]['name'],
                                          style: FormTextStyle,
                                        ),
                                        Text(
                                          search['suggestedDoctors']
                                              [index]['hospitalName'],
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
          ],
        ),
      ),
    );
  }
}
