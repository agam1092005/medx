// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medx/FormPages/BloodType.dart';
import '../AdditionalFiles/TextForm.dart';
import '../AdditionalFiles/constants.dart';

class DOB extends StatefulWidget {
  final gender;
  final height;
  final weight;
  const DOB(
      {super.key,
      required this.gender,
      required this.height,
      required this.weight});

  @override
  State<DOB> createState() => _DOBState();
}

class _DOBState extends State<DOB> {
  var dob = DateTime.now().toIso8601String();
  TextEditingController NameController = TextEditingController();
  TextEditingController PhoneController = TextEditingController();
  TextEditingController RelationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: secondaryColor,
        child: const Icon(
          Icons.arrow_forward_ios,
          color: Colors.white,
        ),
        onPressed: () {
          if (NameController.text.isNotEmpty &&
              PhoneController.text.isNotEmpty &&
              RelationController.text.isNotEmpty) {
            Navigator.of(context, rootNavigator: true).push(
              CupertinoPageRoute<bool>(
                fullscreenDialog: false,
                builder: (BuildContext context) => BloodType(
                  gender: widget.gender,
                  height: widget.height,
                  weight: widget.weight,
                  dob: dob,
                  eName: NameController.text,
                  ePhone: PhoneController.text,
                  eRelation: RelationController.text,
                ),
              ),
            );
          }
        },
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.only(left: 16, right: 16, top: 60),
        children: [
          const Text(
            "We always hope for the best,",
            style: SubHeadingTextStyle,
          ),
          const Text(
            "But in case of emergency, we need a contact",
            style: TaglinesTextStyle,
          ),
          const SizedBox(
            height: 20,
          ),
          TextForm(
            hintText: "Name",
            color: accentColor,
            controller: NameController,
          ),
          const SizedBox(
            height: 10,
          ),
          TextForm(
            hintText: "Phone",
            color: accentColor,
            controller: PhoneController,
          ),
          const SizedBox(
            height: 10,
          ),
          TextForm(
            hintText: "Your Relation",
            color: accentColor,
            controller: RelationController,
          ),
          const SizedBox(
            height: 60,
          ),
          const Text(
            "We know you're young,",
            style: SubHeadingTextStyle,
          ),
          const Text(
            "But we need your DOB to get accurate results",
            style: TaglinesTextStyle,
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 250,
            width: double.maxFinite,
            child: CupertinoDatePicker(
              showDayOfWeek: false,
              itemExtent: 50,
              mode: CupertinoDatePickerMode.date,
              initialDateTime: DateTime(DateTime.now().year),
              minimumYear: 1900,
              maximumYear: DateTime.now().year,
              onDateTimeChanged: (DateTime newDateTime) {
                setState(() {
                  dob = newDateTime.toIso8601String();
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
