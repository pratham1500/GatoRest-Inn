import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:front_end/components/navbar.dart';
import 'package:front_end/pages/user_reservation_management.dart';

import '../components/footer.dart';
import '../components/funcsnvars.dart';

class UserAccount extends StatefulWidget {
  const UserAccount({Key? key}) : super(key: key);

  @override
  State<UserAccount> createState() => _UserAccountState();
}

class _UserAccountState extends State<UserAccount> {
  @override
  Widget build(BuildContext context) {
    var descController = TextEditingController();
    var typeController = TextEditingController();
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
                    height: height / 1.2,
                    width: width / 1.2,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          "My Account",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () async {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return const AlertDialog(
                                      content: CircularProgressIndicator(),
                                    );
                                  },
                                );
                                rIds = [];
                                rStart = [];
                                rEnd = [];
                                rActive = [];
                                await FirebaseFirestore.instance
                                    .collection("Standard Rooms")
                                    .get()
                                    .then(
                                  (snapshot) {
                                    for (var document in snapshot.docs) {
                                      if (document["Email"] ==
                                          auth.currentUser?.email) {
                                        rIds.add(document.id);
                                        rEmails.add(document['Email']);
                                        rStart.add(document['StartDate']);
                                        rEnd.add(document['EndDate']);
                                        rActive.add(document['Active']);
                                      }
                                    }
                                  },
                                );
                                await FirebaseFirestore.instance
                                    .collection("Executive Suites")
                                    .get()
                                    .then(
                                  (snapshot) {
                                    for (var document in snapshot.docs) {
                                      if (document["Email"] ==
                                          auth.currentUser?.email) {
                                        rIds.add(document.id);
                                        rEmails.add(document['Email']);
                                        rStart.add(document['StartDate']);
                                        rEnd.add(document['EndDate']);
                                        rActive.add(document['Active']);
                                      }
                                    }
                                  },
                                );
                                Navigator.pop(context);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const ReservUser(),
                                  ),
                                );
                              },
                              child: Container(
                                margin: const EdgeInsets.all(10),
                                height: height / 4.5,
                                width: width / 4.5,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: const Color.fromARGB(
                                        255, 239, 200, 84)),
                                child: const Center(
                                  child: Text(
                                    "Manage Reservations",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      content: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Colors.white.withOpacity(.95),
                                        ),
                                        padding: const EdgeInsets.all(30),
                                        height: height / 2,
                                        width: width / 3,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            const Text(
                                              "Add Service Request",
                                              style: TextStyle(
                                                color: Colors.amber,
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            TextField(
                                              controller: typeController,
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                                labelText: "Service Type (Electrical, Cleaning, etc.)",
                                              ),
                                            ),
                                            TextField(
                                              controller: descController,
                                              maxLines:5,
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                                labelText: "Description",
                                              ),
                                            ),
                                            const SizedBox(),
                                            ElevatedButton(
                                              onPressed: () async {
                                                if (typeController
                                                    .text.isNotEmpty) {
                                                  if (descController
                                                      .text.isNotEmpty) {
                                                    FirebaseFirestore.instance
                                                        .collection(
                                                            "Service Requests")
                                                        .add({
                                                      "Description":
                                                          descController.text,
                                                      "Email": auth
                                                          .currentUser?.email,
                                                      "Service Type":
                                                          typeController.text,
                                                    });
                                                    descController.clear();
                                                    typeController.clear();
                                                    Navigator.pop(context);
                                                    showDialog(
                                                      context: context,
                                                      builder: (context) {
                                                        return const AlertDialog(
                                                          title: Text(
                                                              "Service Request registered successfully!"),
                                                        );
                                                      },
                                                    );
                                                  } else {
                                                    showDialog(
                                                      context: context,
                                                      builder: (context) {
                                                        return const AlertDialog(
                                                          title: Text(
                                                              "Description cannot be empty!"),
                                                        );
                                                      },
                                                    );
                                                  }
                                                } else {
                                                  showDialog(
                                                    context: context,
                                                    builder: (context) {
                                                      return const AlertDialog(
                                                        title: Text(
                                                            "Service Type cannot be empty!"),
                                                      );
                                                    },
                                                  );
                                                }
                                              },
                                              child: const Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Text(
                                                  "SUBMIT",
                                                  style:
                                                      TextStyle(fontSize: 20),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ).then((value) {
                                  setState(() {});
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.all(10),
                                height: height / 4.5,
                                width: width / 4.5,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: const Color.fromARGB(
                                        255, 239, 200, 84)),
                                child: const Center(
                                  child: Text(
                                    "Issue Service Requests",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
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
