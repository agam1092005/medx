// ignore_for_file: file_names, use_build_context_synchronously, non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:medx/AdditionalFiles/TextForm.dart';
import 'package:medx/AdditionalFiles/UploadImage.dart';
import 'package:medx/AdditionalFiles/constants.dart';
import 'package:medx/utils.dart';

import '../AdditionalFiles/rounded_button.dart';

class AddPrescription extends StatefulWidget {
  const AddPrescription({super.key});

  @override
  State<AddPrescription> createState() => _AddPrescriptionState();
}

class _AddPrescriptionState extends State<AddPrescription> {
  convertToBase64(File file) async {
    List<int> imageBytes = file.readAsBytesSync();
    String img64 = base64Encode(imageBytes);
    return img64;
  }

  File? SelectedImage;

  var medicalSummary;
  bool boxVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: RoundedButton(
          color: secondaryColor,
          onPressed: () async {
            if (boxVisible) {
              Navigator.pop(context);
            } else {
              if (SelectedImage != null) {
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
                var img = await convertToBase64(SelectedImage!);
                var response = await CreateMedicalRecord(img);
                Navigator.pop(context);
                setState(() {
                  medicalSummary = response[1]['jsonSummary'];
                  boxVisible = true;
                });
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    duration: Duration(seconds: 2),
                    content: Text(
                      "Image not found",
                    ),
                  ),
                );
              }
            }
          },
          width: double.maxFinite,
          height: 50,
          child: Text(
            (boxVisible) ? "Upload" : "Fetch from Prescription",
            style: ButtonTextStyle,
          ),
        ),
      ),
      body: ListView(
        padding:
            const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 60),
        children: [
          const Text(
            "Upload Prescription",
            style: SubHeadingTextStyle,
          ),
          const SizedBox(
            height: 10,
          ),
          UploadImage(
            child: Container(
              height: 300,
              width: double.maxFinite,
              decoration: BoxDecoration(
                image: (SelectedImage != null)
                    ? DecorationImage(
                        image: FileImage(
                          SelectedImage!,
                        ),
                        fit: BoxFit.fill)
                    : null,
                color: Colors.white,
                borderRadius: const BorderRadius.all(
                  Radius.circular(
                    12,
                  ),
                ),
                border: Border.all(color: accentColor, width: 2),
              ),
              child: (SelectedImage == null)
                  ? const Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.camera_alt_outlined,
                          size: 75,
                        ),
                        Text("Take photo or Upload your prescription")
                      ],
                    )
                  : const SizedBox(
                      height: 0,
                    ),
            ),
            galleryUpload: () async {
              final returnedImage = await ImagePicker().pickImage(
                source: ImageSource.gallery,
              );
              if (returnedImage == null) {
                return null;
              }

              var image = File(returnedImage.path);

              setState(() {
                SelectedImage = File(image.absolute.path);
              });
              Navigator.pop(context);
            },
            cameraUpload: () async {
              final returnedImage = await ImagePicker().pickImage(
                source: ImageSource.camera,
              );
              if (returnedImage == null) {
                return null;
              }

              var image = File(returnedImage.path);

              setState(() {
                SelectedImage = File(image.absolute.path);
              });
              Navigator.pop(context);
            },
          ),
          const SizedBox(
            height: 20,
          ),
          const TextForm(
            hintText: 'Add notes or questions from pharmacists...',
            controller: null,
            color: Colors.black38,
          ),
          const SizedBox(
            height: 20,
          ),
          (boxVisible)
          ?  Container(
            height: MediaQuery.of(context).size.width * 0.75,
            width: double.maxFinite,
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
                const Text(
                  "Problem: Asthma",
                      style: FormTextStyle,
                ),
                const Text(
                  "Medicines: Albuterol Inhaler, Fluticasone Propionate 110mcg, Montelukast 10mg",
                  style: FormTextStyle,
                ),
                const Text(
                  "Test Results: Peak Flow: 450 L/min, Spectrometry: FEV1/FVC ratio of 70%, Oxygen Saturation: 95%",
                  style: FormTextStyle,
                ),
                const Text(
                  "Recommendations: Use the albuterol inhaler as needed for shortness of breath., Take fluticasone propionate daily as a preventive measure., Monitor peak flow daily and keep a log.",
                  style: FormTextStyle,
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
                          Icons.date_range_outlined,
                          color: Colors.black38,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          DateFormat('dd-MM-yyyy').format(DateTime.parse(DateTime.now().toString())),
                          style: TextFormTextStyle,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            // child: Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     const Spacer(),
            //     Text(
            //       (medicalSummary['problemsRecognized'].isEmpty) ? "Problem: Asthma" : "${medicalSummary['problemsRecognized']}",
            //       style: FormTextStyle,
            //     ),
            //     Text(
            //       (medicalSummary['medicinesGiven'].isEmpty) ? "Medicines: Albuterol Inhaler, Fluticasone Propionate 110mcg, Montelukast 10mg" : "${medicalSummary['medicinesGiven']}",
            //       style: FormTextStyle,
            //     ),
            //     Text(
            //       (medicalSummary['testResults'].isEmpty) ? "Test Results: Peak Flow: 450 L/min, Spectrometry: FEV1/FVC ratio of 70%, Oxygen Saturation: 95%" : "${medicalSummary['testResults']}",
            //       style: FormTextStyle,
            //     ),
            //     Text(
            //       (medicalSummary['recommendations'].isEmpty) ? "Recommendations: Use the albuterol inhaler as needed for shortness of breath., Take fluticasone propionate daily as a preventive measure., Monitor peak flow daily and keep a log." : "${medicalSummary['recommendations']}",
            //       style: FormTextStyle,
            //     ),
            //     const Spacer(),
            //     Container(
            //       height: MediaQuery.of(context).size.width * 0.15,
            //       decoration: const BoxDecoration(
            //         color: bgColor,
            //         borderRadius: BorderRadius.all(
            //           Radius.circular(
            //             16,
            //           ),
            //         ),
            //       ),
            //       child: Center(
            //         child: Row(
            //           crossAxisAlignment: CrossAxisAlignment.center,
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           children: [
            //             const Icon(
            //               Icons.date_range_outlined,
            //               color: Colors.black38,
            //             ),
            //             const SizedBox(
            //               width: 10,
            //             ),
            //             Text(
            //               (medicalSummary['dateOfPrescription'] == null) ? DateFormat('dd-MM-yyyy').format(DateTime.parse(DateTime.now().toString())) : "${medicalSummary['dateOfPrescription']}",
            //               style: TextFormTextStyle,
            //             ),
            //           ],
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
          ) : const SizedBox(height: 0,),
        ],
      ),
    );
  }
}
