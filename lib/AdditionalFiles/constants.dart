// ignore_for_file: non_constant_identifier_names, constant_identifier_names, file_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

var UserData;
var doctors;
var myAppointments;
var history;

// const storage = FlutterSecureStorage(
//   aOptions: AndroidOptions(
//     encryptedSharedPreferences: true,
//   ),
//   iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock),
// );

final today = DateTime.now().day;

final month = {
  1: "Jan",
  2: "Feb",
  3: "Mar",
  4: "Apr",
  5: "May",
  6: "Jun",
  7: "Jul",
  8: "Aug",
  9: "Sep",
  10: "Oct",
  11: "Nov",
  12: "Dec",
};

final weekday = {
  1: "Mon",
  2: "Tues",
  3: "Wed",
  4: "Thurs",
  5: "Fri",
  6: "Sat",
  7: "Sun",
};

const Color accentColor = Color(0xFF337D73);
const Color bgColor = Color(0xFFFBEFED);
const Color secondaryColor = Color(0xFFD86453);

const HeadingTextStyle = TextStyle(
  fontSize: 30,
  fontWeight: FontWeight.w900,
  color: accentColor,
);

const HeadingTextStyle2 = TextStyle(
  fontSize: 50,
  fontWeight: FontWeight.w900,
  color: accentColor,
);

const TextButtonTextStyle = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w600,
  color: accentColor,
);

const SubHeadingTextStyle = TextStyle(
  fontSize: 25,
  fontWeight: FontWeight.bold,
  color: Colors.black,
);

const SubHeadingTextStyle2 = TextStyle(
  fontSize: 25,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);

const FormTextStyle = TextStyle(
  fontSize: 14,
  color: Colors.black,
  fontWeight: FontWeight.w600,
);

const FormTextStyle2 = TextStyle(
  fontSize: 14,
  color: Colors.white,
  fontWeight: FontWeight.w600,
);

const SubFormTextStyle = TextStyle(
  fontSize: 12,
  color: Colors.black38,
  fontWeight: FontWeight.w500,
);

const SubFormTextStyle2 = TextStyle(
  fontSize: 12,
  color: Colors.white,
  fontWeight: FontWeight.w500,
);

const TextFormTextStyle = TextStyle(
  fontWeight: FontWeight.w500,
  fontSize: 14,
  color: Colors.black38,
);

const TextFormTextStyle2 = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 16,
  color: accentColor,
);

const TextFormTextStyle3 = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 16,
  color: Colors.black,
);

const AppbarTextStyle = TextStyle(
  fontSize: 20,
  color: Colors.black,
  fontWeight: FontWeight.w600,
);

const AppbarTextStyle2 = TextStyle(
  fontSize: 20,
  color: Colors.white,
  fontWeight: FontWeight.w600,
);

const ButtonTextStyle = TextStyle(
  fontSize: 16,
  color: Colors.white,
  fontWeight: FontWeight.w500,
);

const ButtonTextStyle2 = TextStyle(
  fontSize: 16,
  color: Colors.black,
  fontWeight: FontWeight.w500,
);

const TaglinesTextStyle = TextStyle(
  fontSize: 20,
  color: Colors.black38,
  fontWeight: FontWeight.w600,
);

const ButtonShadow = [
  BoxShadow(
    blurRadius: 10,
    blurStyle: BlurStyle.normal,
    spreadRadius: 4,
    offset: Offset(5, 5),
    color: Colors.black12,
  ),
];