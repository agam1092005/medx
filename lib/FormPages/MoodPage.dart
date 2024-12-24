import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medx/AdditionalFiles/constants.dart';
import 'package:medx/FormPages/GHW.dart';

class MoodPage extends StatefulWidget {
  const MoodPage({super.key});

  @override
  State<MoodPage> createState() => _MoodPageState();
}

class _MoodPageState extends State<MoodPage> {
  var selectedMood = '';
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
          if (selectedMood != '')
            {
              Navigator.of(context, rootNavigator: true).push(
                CupertinoPageRoute<bool>(
                  fullscreenDialog: false,
                  builder: (BuildContext context) => GHW(
                    mood: selectedMood,
                  ),
                ),
              );
            }
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Let's streamline your doctors experience",
              style: SubHeadingTextStyle,
            ),
            const Text(
              "But first, How's your day today",
              style: TaglinesTextStyle,
            ),
            const SizedBox(
              height: 80,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedMood = 'happy';
                    });
                  },
                  child: CircleAvatar(
                    radius: 45,
                    backgroundColor: (selectedMood == 'happy')
                        ? secondaryColor
                        : Colors.transparent,
                    child: const CircleAvatar(
                      radius: 40,
                      backgroundColor: bgColor,
                      child: Image(
                        image: AssetImage(
                          "assets/happy.gif",
                        ),
                        width: 50,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedMood = 'avg';
                    });
                  },
                  child: CircleAvatar(
                    radius: 45,
                    backgroundColor: (selectedMood == 'avg')
                        ? secondaryColor
                        : Colors.transparent,
                    child: const CircleAvatar(
                      radius: 40,
                      backgroundColor: bgColor,
                      child: Image(
                        image: AssetImage(
                          "assets/avg.gif",
                        ),
                        width: 50,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedMood = 'sad';
                    });
                  },
                  child: CircleAvatar(
                    radius: 45,
                    backgroundColor: (selectedMood == 'sad')
                        ? secondaryColor
                        : Colors.transparent,
                    child: const CircleAvatar(
                      radius: 40,
                      backgroundColor: bgColor,
                      child: Image(
                        image: AssetImage(
                          "assets/sad.gif",
                        ),
                        width: 50,
                      ),
                    ),
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
