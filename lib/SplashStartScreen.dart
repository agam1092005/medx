// ignore_for_file: file_names, invalid_use_of_visible_for_testing_member, prefer_typing_uninitialized_variables

import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:flutter_keychain/flutter_keychain.dart';
import 'package:medx/AdditionalFiles/constants.dart';
import 'package:medx/FormPages/MoodPage.dart';
import 'package:medx/utils.dart';
import '../HomePage.dart';
import 'LandingPage.dart';

class SplashStartScreen extends StatefulWidget {
  const SplashStartScreen({super.key});

  @override
  State<SplashStartScreen> createState() => _SplashStartScreenState();
}

class _SplashStartScreenState extends State<SplashStartScreen> {
  var data;
  var jwt;
  var check;

  getData() async {
    (Platform.isAndroid) ? await FlutterDisplayMode.setHighRefreshRate() : null;
    var j = await FlutterKeychain.get(key: "jwt");
    var c = await FlutterKeychain.get(key: "completedProfile");
    setState(() {
      jwt = j;
    });
    if (jwt != null) {
      await FlutterKeychain.put(key: "completedProfile", value: "True");
    }
    setState(() {
      check = c;
    });
    await getUserData();
    await getDoctors();
    await getAppointments();
    await getHistory();
  }

  @override
  void initState() {
    getData();
    Timer(const Duration(seconds: 4), () {
      Navigator.of(context, rootNavigator: true).pushReplacement(
        CupertinoPageRoute<bool>(
          fullscreenDialog: false,
          builder: (BuildContext context) => logic(),
        ),
      );
      HapticFeedback.selectionClick();
    });
    super.initState();
  }

  logic() {
    if (jwt == null)  {
      return const LandingPage();
    } else {
      if (check == "True")
        {
          return const HomePage();
        }
      else {
        return const MoodPage();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return const  Scaffold(
      backgroundColor: bgColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image(image: AssetImage('assets/logo.png',), width: 250,),
          ),
        ],
      ),
    );
  }
}
