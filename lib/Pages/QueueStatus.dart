// ignore_for_file: file_names

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:medx/AdditionalFiles/constants.dart';

class QueueStatus extends StatefulWidget {
  const QueueStatus({super.key});

  @override
  State<QueueStatus> createState() => _QueueStatusState();
}

class _QueueStatusState extends State<QueueStatus> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        padding:
            const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 60),
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "12",
                  style: HeadingTextStyle2,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Estimated Wait Time: 45 minutes",
                style: AppbarTextStyle,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Tips for Your Symptoms",
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
                Text(
                  "• Stay hydrated by drinking plenty of water",
                ),
                Text(
                  "• Rest and avoid strenuous activities",
                ),
                Text(
                  "• Take over-the-counter pain relievers if needed",
                ),
                Text(
                  "• Monitor your temperature regularly",
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Hospital Location",
            style: TextFormTextStyle2,
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.all(
                Radius.circular(
                  12,
                ),
              ),
              image: DecorationImage(
                image: NetworkImage(
                  "https://www.cnnbrasil.com.br/wp-content/uploads/sites/12/2024/02/google-maps-e1707316052388.png?w=1220&h=674&crop=1",
                ),
                fit: BoxFit.cover,
              ),
            ),
            height: MediaQuery.of(context).size.height * 0.3,
            width: double.maxFinite,
            child: Center(
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(
                    16,
                  ),
                ),
                // child: MapLibreMap(
                //   onMapCreated: _onMapCreated,
                //   scrollGesturesEnabled: true,
                //   dragEnabled: true,
                //   zoomGesturesEnabled: true,
                //   compassEnabled: true,
                //   styleString: "https://api.olamaps.io/tiles/vector/v1/styles/default-light-lite/api_key=RWbfxguvpi7We8zXzxIsNPaQ8Fu03UXtTPTct8Gb",
                //   initialCameraPosition: const CameraPosition(
                //     target: LatLng(20.5937, 78.9629),
                //     zoom: 2,
                //   ),
                // ),
                child: GoogleMap(
                  initialCameraPosition: const CameraPosition(
                    target: LatLng(0, 0),
                    zoom: 16,
                  ),
                  onMapCreated: (GoogleMapController controller) {},
                  mapType: MapType.normal,
                  scrollGesturesEnabled: true,
                  gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
                    Factory<OneSequenceGestureRecognizer>(
                      () => EagerGestureRecognizer(),
                    ),
                  },
                  mapToolbarEnabled: false,
                  compassEnabled: true,
                  zoomControlsEnabled: false,
                  zoomGesturesEnabled: true,
                  rotateGesturesEnabled: true,
                  trafficEnabled: true,
                  buildingsEnabled: true,
                ),
                ),
              ),
            ),
          const SizedBox(
            height: 20,
          ),
          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Distance:  ",
                style: FormTextStyle,
              ),
              Expanded(
                child: Text(
                  "3.2 miles",
                ),
              ),
            ],
          ),
          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Travel Time (Estimated):  ",
                style: FormTextStyle,
              ),
              Expanded(
                child: Text(
                  "15 minutes",
                ),
              ),
            ],
          ),
          // const Row(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   children: [
          //     Text(
          //       "Leave by:  ",
          //       style: FormTextStyle,
          //     ),
          //     Expanded(
          //       child: Text(
          //         "2:15 PM",
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
