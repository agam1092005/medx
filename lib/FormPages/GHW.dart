// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medx/FormPages/dob.dart';

import '../AdditionalFiles/constants.dart';

class GHW extends StatefulWidget {
  final mood;
  const GHW({super.key, required this.mood});

  @override
  State<GHW> createState() => _GHWState();
}

class _GHWState extends State<GHW> {
  moodLine() {
    if (widget.mood == "happy") {
      return "Great, You're happy We're happy";
    } else if (widget.mood == "avg") {
      return "Its fine, Everyone has some rough days";
    } else if (widget.mood == "sad") {
      return "You will be alright, Try relaxing a bit";
    }
  }

  TextEditingController HController = TextEditingController();
  TextEditingController WController = TextEditingController();

  var selectedGender = '';
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
          if (selectedGender != '' &&
              HController.text.isNotEmpty &&
              WController.text.isNotEmpty) {
            Navigator.of(context, rootNavigator: true).push(
              CupertinoPageRoute<bool>(
                fullscreenDialog: false,
                builder: (BuildContext context) => DOB(
                  gender: selectedGender,
                  height: HController.text,
                  weight: WController.text,
                ),
              ),
            );
          }
        },
      ),
      body: ListView(
        padding:
            const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 60),
        scrollDirection: Axis.vertical,
        children: [
          Text(
            moodLine(),
            style: SubHeadingTextStyle,
          ),
          const Text(
            "Let's get started",
            style: TaglinesTextStyle,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Gender",
            style: TaglinesTextStyle,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedGender = "Male";
                  });
                },
                child: Container(
                  height: MediaQuery.of(context).size.width * 0.25,
                  width: MediaQuery.of(context).size.width * 0.25,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color:
                        (selectedGender == "Male") ? secondaryColor : bgColor,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(
                        16,
                      ),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.male,
                        color: (selectedGender == "Male")
                            ? Colors.white
                            : Colors.black,
                      ),
                      Text(
                        "Male",
                        style: (selectedGender == "Male")
                            ? AppbarTextStyle2
                            : AppbarTextStyle,
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedGender = "Female";
                  });
                },
                child: Container(
                  height: MediaQuery.of(context).size.width * 0.25,
                  width: MediaQuery.of(context).size.width * 0.25,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color:
                        (selectedGender == "Female") ? secondaryColor : bgColor,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(
                        16,
                      ),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.female,
                        color: (selectedGender == "Female")
                            ? Colors.white
                            : Colors.black,
                      ),
                      Text(
                        "Female",
                        style: (selectedGender == "Female")
                            ? AppbarTextStyle2
                            : AppbarTextStyle,
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedGender = "Others";
                  });
                },
                child: Container(
                  height: MediaQuery.of(context).size.width * 0.25,
                  width: MediaQuery.of(context).size.width * 0.25,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color:
                        (selectedGender == "Others") ? secondaryColor : bgColor,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(
                        16,
                      ),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.transgender,
                        color: (selectedGender == "Others")
                            ? Colors.white
                            : Colors.black,
                      ),
                      Text(
                        "Others",
                        style: (selectedGender == "Others")
                            ? AppbarTextStyle2
                            : AppbarTextStyle,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Height",
            style: TaglinesTextStyle,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(
                Icons.height,
                color: secondaryColor,
                size: 100,
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: TextFormField(
                    textInputAction: TextInputAction.done,
                    cursorColor: Colors.black38,
                    controller: HController,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(
                      fontSize: 50,
                      color: accentColor,
                      fontWeight: FontWeight.bold,
                    ),
                    onChanged: (value) {
                      TextSelection previousSelection = HController.selection;
                      HController.text = value;
                      HController.selection = previousSelection;
                    },
                    decoration: InputDecoration(
                      hintText: "5.11",
                      hintStyle: const TextStyle(
                        fontSize: 50,
                        color: Colors.black38,
                        fontWeight: FontWeight.bold,
                      ),
                      suffixIcon: const Text(
                        "ft ",
                        style: TextStyle(
                          fontSize: 50,
                          color: Colors.black38,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: accentColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Weight",
            style: TaglinesTextStyle,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(
                Icons.monitor_weight_rounded,
                color: secondaryColor,
                size: 100,
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: TextFormField(
                    textInputAction: TextInputAction.done,
                    cursorColor: Colors.black38,
                    controller: WController,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(
                      fontSize: 50,
                      color: accentColor,
                      fontWeight: FontWeight.bold,
                    ),
                    onChanged: (value) {
                      TextSelection previousSelection = WController.selection;
                      WController.text = value;
                      WController.selection = previousSelection;
                    },
                    decoration: InputDecoration(
                      hintText: "60",
                      hintStyle: const TextStyle(
                        fontSize: 50,
                        color: Colors.black38,
                        fontWeight: FontWeight.bold,
                      ),
                      suffixIcon: const Text(
                        "KG ",
                        style: TextStyle(
                          fontSize: 50,
                          color: Colors.black38,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: accentColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
