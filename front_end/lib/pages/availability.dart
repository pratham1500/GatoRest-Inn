import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:front_end/components/funcsnvars.dart';
import 'package:intl/intl.dart';
import '../components/footer.dart';
import '../components/navbar.dart';

class AvailabilityPage extends StatefulWidget {
  const AvailabilityPage({Key? key}) : super(key: key);

  @override
  State<AvailabilityPage> createState() => _AvailabilityPageState();
}

class _AvailabilityPageState extends State<AvailabilityPage> {
  int roomCount = 0;
  String msgText = "";
  bool standard = true;
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  var startController = TextEditingController();
  var endController = TextEditingController();
  var formatter = DateFormat('MM-dd-yyyy');
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: height,
              width: width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/background.jpg"),
                    fit: BoxFit.cover),
              ),
              child: Column(
                children: [
                  const NavBar(),
                  const Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.95),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    height: height / 1.3,
                    width: width / 1.3,
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          "Check for Availability",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: width / 1.5,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedBox(
                                        width: width / 8,
                                        child: TextField(
                                          controller: startController,
                                          decoration: const InputDecoration(
                                            label: Text(
                                              "Check in Date",
                                            ),
                                          ),
                                          enabled: false,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime.now(),
                                            lastDate: DateTime(2050),
                                          ).then(
                                            (value) {
                                              if (value != null) {
                                                setState(
                                                  () {
                                                    roomCount = 0;

                                                    startDate = value;
                                                    startController.text =
                                                        formatter.format(value);
                                                    if (endController
                                                        .text.isNotEmpty) {
                                                      if (endDate.isBefore(
                                                          startDate)) {
                                                        endDate = startDate;
                                                        endController.text =
                                                            startController
                                                                .text;
                                                      }
                                                    }
                                                  },
                                                );
                                              }
                                            },
                                          );
                                        },
                                        icon: const Icon(Icons.calendar_today),
                                      ),
                                      const SizedBox(
                                        width: 25,
                                      ),
                                      SizedBox(
                                        width: width / 8,
                                        child: TextField(
                                          controller: endController,
                                          decoration: const InputDecoration(
                                            label: Text(
                                              "Check out Date",
                                            ),
                                          ),
                                          enabled: false,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          showDatePicker(
                                            context: context,
                                            initialDate: startDate,
                                            firstDate: startDate,
                                            lastDate: DateTime(2050),
                                          ).then(
                                            (value) {
                                              if (value != null) {
                                                setState(
                                                  () {
                                                    endDate = value;
                                                    endController.text =
                                                        formatter.format(value);
                                                    roomCount = 0;
                                                  },
                                                );
                                              }
                                            },
                                          );
                                        },
                                        icon: const Icon(
                                          Icons.calendar_today,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      const Text("Room Type:"),
                                      Checkbox(
                                          value: standard,
                                          onChanged: (value) {
                                            setState(() {
                                              roomCount = 0;
                                              standard = value!;
                                            });
                                          }),
                                      const Text("Standard Room"),
                                      Checkbox(
                                          value: !standard,
                                          onChanged: (value) {
                                            setState(() {
                                              roomCount = 0;
                                              standard = !value!;
                                            });
                                          }),
                                      const Text("Executive Suite")
                                    ],
                                  ),
                                ],
                              ),
                              ElevatedButton(
                                onPressed: () async {
                                  if (startController.text.isNotEmpty) {
                                    if (endController.text.isNotEmpty) {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return const AlertDialog(
                                            content:
                                                CircularProgressIndicator(),
                                          );
                                        },
                                      );
                                      roomCount = 0;
                                      await FirebaseFirestore.instance
                                          .collection(standard
                                              ? "Standard Rooms"
                                              : "Executive Suites")
                                          .get()
                                          .then(
                                        (snapshot) {
                                          for (var document in snapshot.docs) {
                                            if (endDate.isBefore(
                                                document["StartDate"]
                                                    .toDate())) {
                                              roomCount++;
                                            }
                                            if (startDate.isAfter(
                                                document["EndDate"].toDate())) {
                                              roomCount++;
                                            }
                                          }
                                        },
                                      );
                                      Navigator.pop(context);
                                      if (roomCount != 0) {
                                        msgText =
                                            "Good News! There are $roomCount vacancies available!";
                                      } else {
                                        msgText =
                                            "Sorry! There are no vacancies available in the selected days";
                                      }
                                      setState(() {});
                                    }
                                  }
                                },
                                child: const Text(
                                  "Submit",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          msgText,
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        roomCount != 0
                            ? ElevatedButton(
                                onPressed: () async {
                                  if (auth.currentUser != null) {
                                    await FirebaseFirestore.instance
                                        .collection(standard
                                            ? "Standard Rooms"
                                            : "Executive Suites")
                                        .get()
                                        .then(
                                      (snapshot) {
                                        for (var document in snapshot.docs) {
                                          if (endDate.isBefore(
                                              document["StartDate"].toDate())) {
                                            FirebaseFirestore.instance
                                                .collection(standard
                                                    ? "Standard Rooms"
                                                    : "Executive Suites")
                                                .doc(document.id)
                                                .set({
                                              "EndDate":
                                                  Timestamp.fromDate(startDate),
                                              "StartDate":
                                                  Timestamp.fromDate(endDate),
                                              "SuiteUser": uid,
                                            });
                                            break;
                                          }
                                          if (startDate.isAfter(
                                              document["EndDate"].toDate())) {
                                            FirebaseFirestore.instance
                                                .collection(standard
                                                    ? "Standard Rooms"
                                                    : "Executive Suites")
                                                .doc(document.id)
                                                .set({
                                              "EndDate":
                                                  Timestamp.fromDate(startDate),
                                              "StartDate":
                                                  Timestamp.fromDate(endDate),
                                              "SuiteUser": uid,
                                            });
                                            break;
                                          }
                                        }
                                      },
                                    );
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return const AlertDialog(
                                          title: Text(
                                              "Your room has been reserved!"),
                                        );
                                      },
                                    ).then((value) {
                                      setState(() {
                                        startController.clear();
                                        endController.clear();
                                      });
                                    });
                                  } else {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return const AlertDialog(
                                          title: Text("Please log in first!"),
                                        );
                                      },
                                    );
                                  }
                                },
                                child: const Text(
                                  "Reserve a room",
                                  style: TextStyle(fontSize: 18),
                                ))
                            : const SizedBox(),
                      ],
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
