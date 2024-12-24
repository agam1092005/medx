// ignore_for_file: file_names, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:medx/AdditionalFiles/constants.dart';
import 'package:medx/ID/Login.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  late final PageController _controller;


  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SizedBox(
        child: PageView(
          controller: _controller,
          physics: const PageScrollPhysics(),
          scrollDirection: Axis.horizontal,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage(
                      "assets/5.png",
                    ),
                    width: 300,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Your health journey, organized and accessible. Specialists get the full picture, you get better care.",
                    textAlign: TextAlign.center,
                    style: TaglinesTextStyle,
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: const AssetImage(
                      "assets/6.png",
                    ),
                    width: MediaQuery.of(context).size.width,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    "Skip the wait, not the care. Book online, arrive on time, stay healthy with our smart queuing system.",
                    textAlign: TextAlign.center,
                    style: TaglinesTextStyle,
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage(
                      "assets/4.png",
                    ),
                    width: 300,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Your safety is our priority. We remember your allergies, so every prescription is a safe prescription.",
                    textAlign: TextAlign.center,
                    style: TaglinesTextStyle,
                  ),
                ],
              ),
            ),
            const Login(),
          ],
        ),
      ),
    );
  }
}
