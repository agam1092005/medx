// ignore_for_file: prefer_typing_uninitialized_variables, non_constant_identifier_names, file_names, use_build_context_synchronously

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:medx/AdditionalFiles/DraggableSheet.dart';
import 'package:medx/AdditionalFiles/constants.dart';
import 'package:medx/AdditionalFiles/rounded_button.dart';
import 'package:medx/utils.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'DetailedAppointment.dart';

class BookAppointment extends StatefulWidget {
  final String doctor;
  final doctorID;
  final String hospital;
  final DocImage;
  final desc;
  final queueNumber;
  final type;
  final averageAppointmentTime;
  const BookAppointment({
    super.key,
    required this.doctor,
    required this.hospital,
    required this.DocImage,
    required this.desc,
    required this.doctorID,
    this.queueNumber,
    this.averageAppointmentTime,
    required this.type,
  });

  @override
  State<BookAppointment> createState() => _BookAppointmentState();
}

class _BookAppointmentState extends State<BookAppointment> {
  var time;
  var date;
  var slots;
  var now = DateTime.now();
  var ArtistsTimeSlotByDate = {};
  var ArtistsTimeSlotByDateOriginal = {};

  void getTimeSlotsOfDay() async {
    var s = await GetSlots(widget.doctorID);
    setState(() {
      slots = s[1];
    });

    Map<String, List> groupedByDate = {};
    Map<String, List> groupedByDateOriginal = {};

    if (slots.isNotEmpty) {
      for (var timestamp in slots) {
        DateTime dateTime = DateTime.parse(timestamp['slot']).add(
          const Duration(
            hours: 5,
            minutes: 30,
          ),
        );
        String date = DateFormat('yyyy-MM-dd').format(dateTime);
        String time = DateFormat('h:mm a').format(dateTime);
        if (!groupedByDate.containsKey(date)) {
          groupedByDate[date] = [];
        }
        if (!groupedByDateOriginal.containsKey(date)) {
          groupedByDateOriginal[date] = [];
        }

        if (date == DateTime.now().toString().substring(0, 10)) {
          if (DateTime.now().toLocal().toString().compareTo(
                  DateTime.parse(timestamp['slot'].toString())
                      .toLocal()
                      .toString()) <
              0) {
            groupedByDate[date]!
                .add({'slot': time, 'isBooked': timestamp['isBooked']});
            groupedByDateOriginal[date]!.add(dateTime.toIso8601String());
          }
        } else {
          groupedByDate[date]!
              .add({'slot': time, 'isBooked': timestamp['isBooked']});
          groupedByDateOriginal[date]!.add(dateTime.toIso8601String());
        }
      }
      setState(() {
        ArtistsTimeSlotByDate = groupedByDate;
        ArtistsTimeSlotByDateOriginal = groupedByDateOriginal;
      });
    }
    setState(() {});
  }

  Razorpay? _razorpay;

  void handlerSuccess(PaymentSuccessResponse response) async {
 DateTime originalDate = DateTime.parse(date);

    String additionalTimeStr = time;

    List<String> parts =
    additionalTimeStr.split(':');
    int additionalHours = int.parse(
        parts[0].toString().substring(11, 13));
    int additionalMinutes = int.parse(parts[1]);

    DateTime newDateTime = originalDate.add(
        Duration(
            hours: additionalHours,
            minutes: additionalMinutes));

    DateFormat formatter =
    DateFormat('yyyy-MM-ddTHH:mm:ssZ');
    String formattedDateTime =
    formatter.format(newDateTime.toLocal());

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
    var response =
        await CreateAppointment(widget.doctorID, "$formattedDateTime+05:30");
    Navigator.pop(context);
    if (response[0] == 200 || response[0] == 201) {
      var data = response[1]['appointment'];
      data['doctorName'] = response[1]['doctorName'];
      data['time'] = response[1]['time'];
      data['time'] = response[1]['time'];
      data['appointmentDuration'] = response[1]['appointmentDuration'];
      Navigator.of(context, rootNavigator: true).pushReplacement(
        CupertinoPageRoute<bool>(
          fullscreenDialog: false,
          builder: (BuildContext context) => DetailedAppointment(
            data: data,
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(response.toString()),
        ),
      );
    }
    print(response);
  }

  void handlerFailure(PaymentFailureResponse response) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Transaction failed"),
      ),
    );
    print(response);
  }

  void handlerExternal(ExternalWalletResponse response) {
    print(response);
  }

  @override
  void initState() {
    super.initState();
    if (widget.type != "vQueue") {
      getTimeSlotsOfDay();
    }
    _razorpay = Razorpay();
    _razorpay?.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlerSuccess);
    _razorpay?.on(Razorpay.EVENT_PAYMENT_ERROR, handlerFailure);
    _razorpay?.on(Razorpay.EVENT_EXTERNAL_WALLET, handlerExternal);
  }

  makePayment() {
    var transaction = {
      "key": "rzp_test_YjOu38M2dxdNJ5",
      "amount": 0,
      "name": "Agam",
      "description": "Saturnalia Coupon",
      "prefill": {"contact": "+919478552947", "email": "support@medx.org.in"},
    };

    try {
      _razorpay?.open(transaction);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * (0.35),
            margin: const EdgeInsets.only(top: 40),
            decoration: BoxDecoration(
              color: Colors.transparent,
              image: DecorationImage(
                  fit: BoxFit.fitHeight, image: AssetImage(widget.DocImage)),
            ),
          ),
          DraggableSheet(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.doctor,
                    style: SubHeadingTextStyle,
                  ),
                  Text(
                    widget.hospital,
                    style: TextFormTextStyle,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    color: Colors.black38,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Description",
                    style: AppbarTextStyle,
                  ),
                  Text(
                    widget.desc,
                    style: TextFormTextStyle,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  (slots == null)
                      ? (widget.type == 'vQueue')
                          ? Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "${widget.queueNumber}",
                                    style: HeadingTextStyle,
                                  ),
                                  const Text(
                                    "Current queue number",
                                    style: TextFormTextStyle3,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "Avg. ${widget.averageAppointmentTime}min time is taken per patient",
                                    style: TextFormTextStyle,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  RoundedButton(
                                    color: secondaryColor,
                                    onPressed: () async {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return BackdropFilter(
                                              filter: ImageFilter.blur(
                                                sigmaX: 2,
                                                sigmaY: 2,
                                              ),
                                              child: const Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  color: secondaryColor,
                                                ),
                                              ),
                                            );
                                          });
                                      await makePayment();
                                      Navigator.pop(context);
                                      HapticFeedback.selectionClick();
                                      await getAppointments();
                                    },
                                    height: 50,
                                    width: double.maxFinite,
                                    child: const Text(
                                      "Continue to pay",
                                      style: ButtonTextStyle,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  RoundedButton(
                                    color: secondaryColor,
                                    onPressed: () async {
                                      DateTime originalDate = DateTime.parse(DateTime.now().toIso8601String());
                                      time = originalDate.toString();
                                      String additionalTimeStr = time;

                                      List<String> parts =
                                      additionalTimeStr.split(':');
                                      int additionalHours = int.parse(
                                          parts[0].toString().substring(11, 13));
                                      int additionalMinutes = int.parse(parts[1]);

                                      DateTime newDateTime = originalDate.add(
                                          Duration(
                                              hours: additionalHours,
                                              minutes: additionalMinutes));

                                      DateFormat formatter =
                                      DateFormat('yyyy-MM-ddTHH:mm:ssZ');
                                      String formattedDateTime =
                                      formatter.format(newDateTime.toLocal());
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
                                      var response = await CreateAppointment(
                                          widget.doctorID,
                                          "$formattedDateTime+05:30");
                                      Navigator.pop(context);
                                      if (response[0] == 200 || response[0] == 201) {
                                        var data = response[1]['appointment'];
                                        data['doctorName'] =
                                        response[1]['doctorName'];
                                        data['time'] = response[1]['time'];
                                        data['time'] = response[1]['time'];
                                        data['appointmentDuration'] =
                                        response[1]['appointmentDuration'];
                                        Navigator.of(context, rootNavigator: true)
                                            .pushReplacement(
                                          CupertinoPageRoute<bool>(
                                            fullscreenDialog: false,
                                            builder: (BuildContext context) =>
                                                DetailedAppointment(
                                                  data: data,
                                                ),
                                          ),
                                        );
                                      }
                                      HapticFeedback.selectionClick();
                                      await getAppointments();
                                    },
                                    height: 50,
                                    width: double.maxFinite,
                                    child: const Text(
                                      "Test without payment",
                                      style: ButtonTextStyle,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : const Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 60,
                                  ),
                                  CircularProgressIndicator(
                                    color: accentColor,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "Loading available slots...",
                                    style: FormTextStyle,
                                  ),
                                ],
                              ),
                            )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              "Select Date",
                              style: AppbarTextStyle,
                            ),
                            SizedBox(
                              height: 100,
                              width: double.maxFinite,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                padding: EdgeInsets.zero,
                                physics: const BouncingScrollPhysics(),
                                itemCount: ArtistsTimeSlotByDate.keys.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 8),
                                    child: ChoiceChip(
                                      label: SizedBox(
                                        height: 60,
                                        child: Column(
                                          children: [
                                            Text(
                                              "${DateFormat('dd-MM-yyyy').format(
                                                    DateTime.parse(
                                                      ArtistsTimeSlotByDate.keys
                                                          .toList()[index],
                                                    ),
                                                  ).toString().substring(0, 2)} ${month[int.parse(DateFormat('dd-MM-yyyy').format(
                                                    DateTime.parse(
                                                      ArtistsTimeSlotByDate.keys
                                                          .toList()[index],
                                                    ),
                                                  ).toString().substring(3, 5))]}",
                                            ),
                                            (DateTime.parse(ArtistsTimeSlotByDate
                                                                    .keys
                                                                    .toList()[
                                                                index])
                                                            .weekday +
                                                        index ==
                                                    7)
                                                ? const Text("Sun")
                                                : Text(weekday[(DateTime.now()
                                                                    .weekday +
                                                                index)
                                                            .toInt() %
                                                        7]
                                                    .toString()),
                                          ],
                                        ),
                                      ),
                                      showCheckmark: false,
                                      selectedColor: accentColor,
                                      labelPadding: const EdgeInsets.symmetric(
                                          horizontal: 24, vertical: 8),
                                      backgroundColor: bgColor,
                                      shadowColor: Colors.transparent,
                                      selectedShadowColor: Colors.transparent,
                                      labelStyle: (date ==
                                              ArtistsTimeSlotByDate.keys
                                                  .toList()[index])
                                          ? AppbarTextStyle2
                                          : AppbarTextStyle,
                                      selected: (date ==
                                              ArtistsTimeSlotByDate.keys
                                                  .toList()[index])
                                          ? true
                                          : false,
                                      onSelected: (val) {
                                        setState(() {
                                          date = ArtistsTimeSlotByDate.keys
                                              .toList()[index];
                                        });
                                      },
                                    ),
                                  );
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            (date == null)
                                ? const SizedBox(
                                    height: 0,
                                  )
                                : const Text(
                                    "Select Time",
                                    style: AppbarTextStyle,
                                  ),
                            (date == null)
                                ? const SizedBox(
                                    height: 0,
                                  )
                                : (ArtistsTimeSlotByDate[date].length != 0)
                                    ? SizedBox(
                                        height: 50,
                                        width: double.maxFinite,
                                        child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          padding: EdgeInsets.zero,
                                          physics:
                                              const BouncingScrollPhysics(),
                                          itemCount: ArtistsTimeSlotByDate[date]
                                              .length,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 8),
                                              child: ChoiceChip(
                                                label: Text(
                                                  ArtistsTimeSlotByDate[date]
                                                          [index]['slot']
                                                      .toString(),
                                                ),
                                                showCheckmark: false,
                                                labelPadding:
                                                    const EdgeInsets.all(8),
                                                selectedColor: accentColor,
                                                backgroundColor:
                                                    (ArtistsTimeSlotByDate[date]
                                                            [index]['isBooked'])
                                                        ? Colors.grey
                                                        : bgColor,
                                                shadowColor: Colors.transparent,
                                                selectedShadowColor:
                                                    Colors.transparent,
                                                labelStyle: (time ==
                                                        ArtistsTimeSlotByDateOriginal[
                                                                date][index]
                                                            .toString())
                                                    ? FormTextStyle2
                                                    : FormTextStyle,
                                                selected: (time ==
                                                        ArtistsTimeSlotByDateOriginal[
                                                                date][index]
                                                            .toString())
                                                    ? true
                                                    : false,
                                                onSelected: (val) {
                                                  if (ArtistsTimeSlotByDate[
                                                          date][index]
                                                      ['isBooked']) {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      const SnackBar(
                                                        duration: Duration(
                                                            seconds: 1),
                                                        content: Text(
                                                          "Slot unavailable",
                                                        ),
                                                      ),
                                                    );
                                                  } else {
                                                    setState(() {
                                                      time =
                                                          (ArtistsTimeSlotByDateOriginal[
                                                                  date][index]
                                                              .toString());
                                                    });
                                                  }
                                                },
                                              ),
                                            );
                                          },
                                        ),
                                      )
                                    : const Text(
                                        "No slots available for booking"),
                            const SizedBox(
                              height: 40,
                            ),
                            RoundedButton(
                              color: secondaryColor,
                              onPressed: () async {
                                DateTime originalDate = DateTime.parse(date);

                                String additionalTimeStr = time;

                                List<String> parts =
                                    additionalTimeStr.split(':');
                                int additionalHours = int.parse(
                                    parts[0].toString().substring(11, 13));
                                int additionalMinutes = int.parse(parts[1]);

                                DateTime newDateTime = originalDate.add(
                                    Duration(
                                        hours: additionalHours,
                                        minutes: additionalMinutes));

                                DateFormat formatter =
                                    DateFormat('yyyy-MM-ddTHH:mm:ssZ');
                                String formattedDateTime =
                                    formatter.format(newDateTime.toLocal());
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
                                var response = await CreateAppointment(
                                    widget.doctorID,
                                    "$formattedDateTime+05:30");
                                Navigator.pop(context);
                                if (response[0] == 200 || response[0] == 201) {
                                  var data = response[1]['appointment'];
                                  data['doctorName'] =
                                      response[1]['doctorName'];
                                  data['time'] = response[1]['time'];
                                  data['time'] = response[1]['time'];
                                  data['appointmentDuration'] =
                                      response[1]['appointmentDuration'];
                                  Navigator.of(context, rootNavigator: true)
                                      .pushReplacement(
                                    CupertinoPageRoute<bool>(
                                      fullscreenDialog: false,
                                      builder: (BuildContext context) =>
                                          DetailedAppointment(
                                        data: data,
                                      ),
                                    ),
                                  );
                                }
                                HapticFeedback.selectionClick();
                                await getAppointments();
                              },
                              height: 50,
                              width: double.maxFinite,
                              child: const Text(
                                "Book Appointment",
                                style: ButtonTextStyle,
                              ),
                            ),
                          ],
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
