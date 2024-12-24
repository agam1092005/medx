// ignore_for_file: file_names, use_build_context_synchronously, unused_field

import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medx/AdditionalFiles/constants.dart';
import 'package:medx/Pages/DetailedAppointment.dart';
import '../utils.dart';

class Appointments extends StatefulWidget {
  const Appointments({super.key});

  @override
  State<Appointments> createState() => _AppointmentsState();
}

class _AppointmentsState extends State<Appointments> {

  Timer? _timer;

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
    setState(() {});
    });
  }

  @override
  void initState() {
    _startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: Padding(
      //   padding: const EdgeInsets.all(16),
      //   child: RoundedButton(
      //     color: secondaryColor,
      //     onPressed: () {
      //       Navigator.of(context, rootNavigator: true).push(
      //         CupertinoPageRoute<bool>(
      //           fullscreenDialog: false,
      //           builder: (BuildContext context) => const QueueStatus(),
      //         ),
      //       );
      //       HapticFeedback.selectionClick();
      //     },
      //     width: double.maxFinite,
      //     height: 50,
      //     child: const Text(
      //       "Join Virtual Queue",
      //       style: ButtonTextStyle,
      //     ),
      //   ),
      // ),
      body: (myAppointments == null)
          ? const Padding(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                top: 60,
              ),
              child: Column(
                children: [
                  Text(
                    "No Appointments",
                    style: SubHeadingTextStyle,
                  ),
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 60,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Your Appointments",
                    style: SubHeadingTextStyle,
                  ),
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: myAppointments.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () async {
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
                            var res = await getDetailedAppointments(
                                myAppointments[index]['id']);
                            Navigator.pop(context);
                            if (res[0] == 200 || res[0] == 201) {
                              Navigator.of(context, rootNavigator: true).push(
                                CupertinoPageRoute<bool>(
                                  fullscreenDialog: false,
                                  builder: (BuildContext context) =>
                                      DetailedAppointment(
                                    data: res[1],
                                  ),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  duration: Duration(seconds: 1),
                                  content: Text("Unable to fetch information"),
                                ),
                              );
                            }
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 4),
                            padding: const EdgeInsets.all(16),
                            width: double.maxFinite,
                            decoration: const BoxDecoration(
                              color: bgColor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  12,
                                ),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Dr. ${myAppointments[index]['doctorName']}",
                                  style: AppbarTextStyle,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Scheduled time:  ",
                                      style: FormTextStyle,
                                    ),
                                    Expanded(
                                      child: Text(
                                        "${myAppointments[index]['time'].toString().substring(8, 10)} ${month[int.parse(myAppointments[index]['time'].toString().substring(5, 7))]} at ${DateFormat('h:mm a').format(DateTime.parse(myAppointments[index]['time'].toString()).toLocal())}",
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Appointment duration:  ",
                                      style: FormTextStyle,
                                    ),
                                    Expanded(
                                      child: Text(
                                          "${myAppointments[index]['appointmentDuration'].toString()} min"),
                                    ),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Your Number:  ",
                                      style: FormTextStyle,
                                    ),
                                    Expanded(
                                      child: Text(
                                        myAppointments[index]
                                                ['appointmentNumber']
                                            .toString(),
                                        style: TextButtonTextStyle,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
