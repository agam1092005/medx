// ignore_for_file: file_names, use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keychain/flutter_keychain.dart';
import 'package:medx/utils.dart';
import '../AdditionalFiles/constants.dart';
import '../AdditionalFiles/rounded_button.dart';
import '../ID/Login.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: accentColor,
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor: Colors.white,
                  title: const Text(
                    "Check-In",
                    style: SubHeadingTextStyle,
                  ),
                  content: Container(
                    color: Colors.white,
                    height: 250,
                    child: Column(
                      children: [
                        Container(
                          height: 250,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            image: DecorationImage(
                              image: AssetImage("assets/qr.png"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              });
        },
        child: const Icon(
          Icons.qr_code_2_outlined,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: RoundedButton(
          color: secondaryColor,
          onPressed: () async {
            await FlutterKeychain.remove(key: "jwt");
            await auth.signOut();
            Navigator.of(context, rootNavigator: true).pushReplacement(
              CupertinoPageRoute<bool>(
                fullscreenDialog: false,
                builder: (BuildContext context) => const Login(),
              ),
            );
          },
          width: double.maxFinite,
          height: 50,
          child: const Text(
            "Logout",
            style: ButtonTextStyle,
          ),
        ),
      ),
      body: ListView(
        physics: const ClampingScrollPhysics(),
        padding:
            const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 60),
        scrollDirection: Axis.vertical,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: secondaryColor,
                  backgroundImage: NetworkImage(UserData['picture'].toString()),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                UserData['name'].toString(),
                style: SubHeadingTextStyle,
              ),
              Text(
                UserData['email'].toString(),
                style: TextFormTextStyle,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Personal Information",
            style: TextFormTextStyle2,
          ),
          Container(
            width: double.maxFinite,
            padding: const EdgeInsets.all(
              16,
            ),
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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "Date of Birth:  ",
                      style: FormTextStyle,
                    ),
                    Expanded(
                      child: Text(
                        UserData['dob'].toString().substring(0, 10),
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "Gender:  ",
                      style: FormTextStyle,
                    ),
                    Expanded(
                      child: Text(
                        UserData['gender'].toString(),
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "Blood Type:  ",
                      style: FormTextStyle,
                    ),
                    Expanded(
                      child: Text(
                        UserData['bloodType'].toString(),
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "Height:  ",
                      style: FormTextStyle,
                    ),
                    Expanded(
                      child: Text(
                        "${UserData['height'].toString().split('.')[0]}' "
                        '${UserData['height'].toString().split('.')[1]}"',
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "Weight:  ",
                      style: FormTextStyle,
                    ),
                    Expanded(
                      child: Text(
                        "${UserData['weight'].toString()} Kg",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Medical History",
            style: TextFormTextStyle2,
          ),
          Container(
            width: double.maxFinite,
            padding: const EdgeInsets.all(
              16,
            ),
            decoration: const BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.all(
                Radius.circular(
                  12,
                ),
              ),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Allergies:  ",
                      style: FormTextStyle,
                    ),
                    Expanded(
                      child: Text(
                        "Penicillin",
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Chronic Conditions:  ",
                      style: FormTextStyle,
                    ),
                    Expanded(
                      child: Text(
                        "None",
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Past Surgeries:  ",
                      style: FormTextStyle,
                    ),
                    Expanded(
                      child: Text(
                        "Appendectomy (2010)",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Emergency Contact",
            style: TextFormTextStyle2,
          ),
          Container(
            width: double.maxFinite,
            padding: const EdgeInsets.all(
              16,
            ),
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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "Name:  ",
                      style: FormTextStyle,
                    ),
                    Expanded(
                      child: Text(
                        UserData['emergencyContact']['name'].toString(),
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "Relationship:  ",
                      style: FormTextStyle,
                    ),
                    Expanded(
                      child: Text(
                        UserData['emergencyContact']['relationship'].toString(),
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "Phone:  ",
                      style: FormTextStyle,
                    ),
                    Expanded(
                      child: Text(
                        UserData['emergencyContact']['phone'].toString(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
