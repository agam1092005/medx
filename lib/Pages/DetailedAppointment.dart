// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../AdditionalFiles/constants.dart';

class DetailedAppointment extends StatefulWidget {
  final data;
  const DetailedAppointment({super.key, required this.data});

  @override
  State<DetailedAppointment> createState() => _DetailedAppointmentState();
}

class _DetailedAppointmentState extends State<DetailedAppointment> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.width * 0.45,
        width: double.maxFinite,
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: ButtonShadow,
          borderRadius: BorderRadius.all(
            Radius.circular(
              16,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Spacer(),
            Center(
              child: Text(
                "Scheduled for ${widget.data['time'].toString().substring(8, 10)} ${month[int.parse(widget.data['time'].toString().substring(5, 7))]}",
                style: SubHeadingTextStyle,
              ),
            ),
            const Spacer(),
            Container(
              height: MediaQuery.of(context).size.width * 0.15,
              decoration: const BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    16,
                  ),
                ),
              ),
              child: Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.access_time_rounded,
                      color: Colors.black38,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "${DateFormat('h:mm a').format(DateTime.parse(widget.data['time'].toString()).toLocal())} - ${DateFormat('h:mm a').format(
                        DateTime.parse(widget.data['time'].toString()).toLocal().add(
                          Duration(
                            minutes: widget.data['appointmentDuration'],
                          ),
                        ),
                      )}",
                      style: TextFormTextStyle,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.only(left: 16, right: 16, top: 60),
        children: [
          Text(
            "Dr. ${widget.data['doctorName']}",
            style: SubHeadingTextStyle,
          ),
          // const Text(
          //   "But will see you shortly",
          //   style: TaglinesTextStyle,
          // ),
          // const SizedBox(
          //   height: 20,
          // ),
          // const Text(
          //   "Your appointment number is",
          //   style: SubHeadingTextStyle,
          // ),
          // Center(
          //   child: Text(
          //     " ${widget.data['appointmentNumber']}",
          //     style: HeadingTextStyle2,
          //   ),
          // ),
          const SizedBox(
            height: 100,
          ),

          Center(
            child: Image.asset("assets/meditate.png", width: 300,),
          ),
          const SizedBox(
            height: 40,
          ),

          const Text(
            "No need to carry your file",
            style: TextFormTextStyle3,
            textAlign: TextAlign.center,
          ),
          const Text(
            "We carry your files, scans, history for you",
            style: TextFormTextStyle2,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
