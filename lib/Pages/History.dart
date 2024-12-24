// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:medx/AdditionalFiles/constants.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  List domains = [
    "General Practitioner",
    "Cardiologist",
    "Dermatologist",
    "Orthopedist",
    "Neurologist"
  ];

  List medicine = [
    "Methotrexate: 12 tablets",
    "Folic Acid: 90 tablets",
    "Prednisone: 30 tablets",
  ];

  var selectedDomain = "General Practitioner";

  renderHistory() {
    if (selectedDomain == "General Practitioner") {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
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
                const Text(
                  "Rheumatology Consultation",
                  style: TextFormTextStyle2,
                ),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Date:  ",
                      style: FormTextStyle,
                    ),
                    Expanded(
                      child: Text(
                        "3 July 2024",
                      ),
                    ),
                  ],
                ),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Diagnosis:  ",
                      style: FormTextStyle,
                    ),
                    Expanded(
                      child: Text(
                        "Rheumatoid Arthritis (ICD-10; M06.9)",
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 40,
                  width: double.maxFinite,
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemCount: medicine.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(left: 0, right: 12),
                        padding: const EdgeInsets.all(4),
                        constraints: const BoxConstraints(minWidth: 150),
                        decoration: const BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              12,
                            ),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            medicine[index].toString(),
                            style: SubFormTextStyle2,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Test Results:  ",
                      style: FormTextStyle,
                    ),
                    Expanded(
                      child: Text(
                        "RF: 75 IU/mL (High), Anti-CCP: 82 U/mL (Positive), ESR: 42 mm/hr (Elevated), CRP: 2.8 mg/dL (Elevated)",
                      ),
                    ),
                  ],
                ),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Physical Therapy:  ",
                      style: FormTextStyle,
                    ),
                    Expanded(
                      child: Text(
                        "2 sessions/week for 6 weeks",
                      ),
                    ),
                  ],
                ),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Next Appointment:  ",
                      style: FormTextStyle,
                    ),
                    Expanded(
                      child: Text(
                        "31 July 2024 at 10:00 AM",
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "Prescription:  ",
                      style: FormTextStyle,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "View Prescription",
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
                const Text(
                  "General Check-up",
                  style: TextFormTextStyle2,
                ),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Date:  ",
                      style: FormTextStyle,
                    ),
                    Expanded(
                      child: Text(
                        "15 May 2024",
                      ),
                    ),
                  ],
                ),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Duration:  ",
                      style: FormTextStyle,
                    ),
                    Expanded(
                      child: Text(
                        "14 days",
                      ),
                    ),
                  ],
                ),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Problems Recognized:  ",
                      style: FormTextStyle,
                    ),
                    Expanded(
                      child: Text(
                        "Mild hypertension, Vitamin D deficiency",
                      ),
                    ),
                  ],
                ),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Test Results:  ",
                      style: FormTextStyle,
                    ),
                    Expanded(
                      child: Text(
                        "Blood pressure 140/90, Vitamin D levels low (20 ng/mL)",
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "Prescription:  ",
                      style: FormTextStyle,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "View Prescription",
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
                const Text(
                  "Dermatology Consultation",
                  style: TextFormTextStyle2,
                ),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Date:  ",
                      style: FormTextStyle,
                    ),
                    Expanded(
                      child: Text(
                        "03 April 2024",
                      ),
                    ),
                  ],
                ),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Duration:  ",
                      style: FormTextStyle,
                    ),
                    Expanded(
                      child: Text(
                        "30 days",
                      ),
                    ),
                  ],
                ),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Problems Recognized:  ",
                      style: FormTextStyle,
                    ),
                    Expanded(
                      child: Text(
                        "Eczema flare-up on hands",
                      ),
                    ),
                  ],
                ),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Test Results:  ",
                      style: FormTextStyle,
                    ),
                    Expanded(
                      child: Text(
                        "Patch test negative for common allergens",
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "Prescription:  ",
                      style: FormTextStyle,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "View Prescription",
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
                const Text(
                  "Orthopedic Evaluation",
                  style: TextFormTextStyle2,
                ),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Date:  ",
                      style: FormTextStyle,
                    ),
                    Expanded(
                      child: Text(
                        "10 February 2024",
                      ),
                    ),
                  ],
                ),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Duration:  ",
                      style: FormTextStyle,
                    ),
                    Expanded(
                      child: Text(
                        "45 days",
                      ),
                    ),
                  ],
                ),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Problems Recognized:  ",
                      style: FormTextStyle,
                    ),
                    Expanded(
                      child: Text(
                        "Mild osteoarthritis in left knee",
                      ),
                    ),
                  ],
                ),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Test Results:  ",
                      style: FormTextStyle,
                    ),
                    Expanded(
                      child: Text(
                        "X-ray shows minor joint space narrowing",
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "Prescription:  ",
                      style: FormTextStyle,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "View Prescription",
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
                const Text(
                  "Annual Physical",
                  style: TextFormTextStyle2,
                ),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Date:  ",
                      style: FormTextStyle,
                    ),
                    Expanded(
                      child: Text(
                        "05 January 2024",
                      ),
                    ),
                  ],
                ),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Duration:  ",
                      style: FormTextStyle,
                    ),
                    Expanded(
                      child: Text(
                        "N/A",
                      ),
                    ),
                  ],
                ),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Problems Recognized:  ",
                      style: FormTextStyle,
                    ),
                    Expanded(
                      child: Text(
                        "Slightly elevated cholesterol",
                      ),
                    ),
                  ],
                ),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Test Results:  ",
                      style: FormTextStyle,
                    ),
                    Expanded(
                      child: Text(
                        "Total cholesterol 210 mg/dL, LDL 130 mg/dL",
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "Prescription:  ",
                      style: FormTextStyle,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "View Prescription",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      );
    } else if (selectedDomain == "Cardiologist") {
      return const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage(
              "assets/3.png",
            ),
            width: 250,
          ),
          Text(
            "No history found",
            textAlign: TextAlign.center,
            style: TaglinesTextStyle,
          ),
        ],
      );
    } else if (selectedDomain == "Dermatologist") {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
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
                const Text(
                  "Dermatology Consultation",
                  style: TextFormTextStyle2,
                ),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Date:  ",
                      style: FormTextStyle,
                    ),
                    Expanded(
                      child: Text(
                        "03 April 2024",
                      ),
                    ),
                  ],
                ),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Duration:  ",
                      style: FormTextStyle,
                    ),
                    Expanded(
                      child: Text(
                        "30 days",
                      ),
                    ),
                  ],
                ),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Problems Recognized:  ",
                      style: FormTextStyle,
                    ),
                    Expanded(
                      child: Text(
                        "Eczema flare-up on hands",
                      ),
                    ),
                  ],
                ),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Test Results:  ",
                      style: FormTextStyle,
                    ),
                    Expanded(
                      child: Text(
                        "Patch test negative for common allergens",
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "Prescription:  ",
                      style: FormTextStyle,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "View Prescription",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      );
    } else if (selectedDomain == "Orthopedist") {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
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
                const Text(
                  "Rheumatology Consultation",
                  style: TextFormTextStyle2,
                ),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Date:  ",
                      style: FormTextStyle,
                    ),
                    Expanded(
                      child: Text(
                        "3 July 2024",
                      ),
                    ),
                  ],
                ),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Diagnosis:  ",
                      style: FormTextStyle,
                    ),
                    Expanded(
                      child: Text(
                        "Rheumatoid Arthritis (ICD-10; M06.9)",
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 40,
                  width: double.maxFinite,
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemCount: medicine.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(left: 0, right: 12),
                        padding: const EdgeInsets.all(4),
                        constraints: const BoxConstraints(minWidth: 150),
                        decoration: const BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              12,
                            ),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            medicine[index].toString(),
                            style: SubFormTextStyle2,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Test Results:  ",
                      style: FormTextStyle,
                    ),
                    Expanded(
                      child: Text(
                        "RF: 75 IU/mL (High), Anti-CCP: 82 U/mL (Positive), ESR: 42 mm/hr (Elevated), CRP: 2.8 mg/dL (Elevated)",
                      ),
                    ),
                  ],
                ),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Physical Therapy:  ",
                      style: FormTextStyle,
                    ),
                    Expanded(
                      child: Text(
                        "2 sessions/week for 6 weeks",
                      ),
                    ),
                  ],
                ),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Next Appointment:  ",
                      style: FormTextStyle,
                    ),
                    Expanded(
                      child: Text(
                        "31 July 2024 at 10:00 AM",
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "Prescription:  ",
                      style: FormTextStyle,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "View Prescription",
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
                const Text(
                  "Orthopedic Evaluation",
                  style: TextFormTextStyle2,
                ),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Date:  ",
                      style: FormTextStyle,
                    ),
                    Expanded(
                      child: Text(
                        "10 February 2024",
                      ),
                    ),
                  ],
                ),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Duration:  ",
                      style: FormTextStyle,
                    ),
                    Expanded(
                      child: Text(
                        "45 days",
                      ),
                    ),
                  ],
                ),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Problems Recognized:  ",
                      style: FormTextStyle,
                    ),
                    Expanded(
                      child: Text(
                        "Mild osteoarthritis in left knee",
                      ),
                    ),
                  ],
                ),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Test Results:  ",
                      style: FormTextStyle,
                    ),
                    Expanded(
                      child: Text(
                        "X-ray shows minor joint space narrowing",
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "Prescription:  ",
                      style: FormTextStyle,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "View Prescription",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      );
    } else if (selectedDomain == "Neurologist") {
      return const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage(
              "assets/3.png",
            ),
            width: 250,
          ),
          Text(
            "No history found",
            textAlign: TextAlign.center,
            style: TaglinesTextStyle,
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: const ClampingScrollPhysics(),
        padding:
            const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 60),
        scrollDirection: Axis.vertical,
        children: [
          const Text(
            "Medical History",
            style: SubHeadingTextStyle,
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 50,
            width: double.maxFinite,
            child: ListView.builder(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: domains.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedDomain = domains[index].toString();
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(left: 0, right: 12),
                    padding: const EdgeInsets.all(8),
                    constraints: const BoxConstraints(minWidth: 130),
                    decoration: BoxDecoration(
                      color: (selectedDomain == domains[index]
                          ? accentColor
                          : Colors.white),
                      border: Border.all(color: accentColor, width: 2),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(
                          12,
                        ),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        domains[index].toString(),
                        style: TextStyle(
                          fontSize: 16,
                          color: (selectedDomain != domains[index]
                              ? accentColor
                              : Colors.white),
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          renderHistory(),
        ],
      ),
    );
  }
}
