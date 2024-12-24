// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables, file_names

import 'package:flutter/material.dart';

import 'constants.dart';

class UploadImage extends StatefulWidget {
  const UploadImage({super.key, required this.child, required this.galleryUpload, required this.cameraUpload});
  final child;
  final galleryUpload;
  final cameraUpload;

  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
            isDismissible: true,
            isScrollControlled: false,
            showDragHandle: false,
            scrollControlDisabledMaxHeightRatio: 0.4,
            context: context,
            builder: (context) {
              return Container(
                width: double.maxFinite,
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(16),
                    topLeft: Radius.circular(16),
                  ),
                ),
                child: Column(
                  children: [
                    const Text(
                      "Choose your Image Location",
                      style: AppbarTextStyle,

                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 2,
                      color: Colors.black12,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ListTile(
                      onTap: widget.galleryUpload,
                      trailing: const Icon(Icons.arrow_forward_ios_outlined),
                      title: const Text(
                        "Choose your photos from Gallery",
                        style: TextFormTextStyle3,
                      ),
                      splashColor: Colors.transparent,
                    ),
                    Container(
                      height: 2,
                      color: Colors.black12,
                    ),
                    ListTile(
                      onTap: widget.cameraUpload,
                      trailing: const Icon(Icons.arrow_forward_ios_outlined),
                      title: const Text(
                        "Capture by Camera",
                        style: TextFormTextStyle3,
                      ),
                      splashColor: Colors.transparent,
                    ),
                    Container(
                      height: 2,
                      color: Colors.black12,
                    ),
                  ],
                ),
              );
            });
      },
      child: widget.child,
    );
  }
}
