import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:front_end/components/funcsnvars.dart';
import 'package:intl/intl.dart';

import '../components/footer.dart';

class ReservAdmin extends StatefulWidget {
  const ReservAdmin({Key? key}) : super(key: key);

  @override
  State<ReservAdmin> createState() => _ReservAdminState();
}

class _ReservAdminState extends State<ReservAdmin> {
  @override
  Widget build(BuildContext context) {
    var formatter = DateFormat('MM-dd-yyyy');

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
                          "Reservation Management",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: height / 1.5,
                          width: width / 2,
                          child: rEmails.isNotEmpty
                              ? Container(
                                height: height/3,
                                child: ListView.builder(
                                    padding: const EdgeInsets.all(8),
                                    itemCount: rEmails.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return ListTile(
                                        title: Row(
                                          children: [
                                            Text(rEmails[index]),
                                            const Spacer(),
                                            Text(formatter
                                                .format(rStart[index].toDate())),
                                            const Spacer(),
                                            Text(formatter
                                                .format(rEnd[index].toDate())),
                                            const Spacer(),
                                            IconButton(
                                              onPressed: () async {
                                                var doc = await FirebaseFirestore
                                                    .instance
                                                    .collection("Standard Rooms")
                                                    .doc(rIds[index])
                                                    .get();
                                                if(doc.exists){
                                                  await FirebaseFirestore
                                                    .instance
                                                    .collection("Standard Rooms")
                                                    .doc(rIds[index])
                                                    .update({                                                
                                                  "Active": true
                                                  });
                                                }
                                                else {
                                                  await FirebaseFirestore
                                                    .instance
                                                    .collection("Executive Suites")
                                                    .doc(rIds[index])
                                                    .update({
                                                  "Active": true
                                                  });
                                                }
                                                rActive[index]=true;
                                                setState(() {});
                                              },
                                              icon: Icon(
                                                Icons.check_box,
                                                color: rActive[index]?Colors.green:Colors.black,
                                              ),
                                            ),
                                            const Spacer(),
                                            IconButton(
                                              onPressed: () async {
                                                if(rIds[index].contains("Room")){
                                                  await FirebaseFirestore
                                                    .instance
                                                    .collection("Standard Rooms")
                                                    .doc(rIds[index])
                                                    .set({
                                                  "EndDate": Timestamp.fromDate(
                                                      DateTime(2000)),
                                                  "StartDate": Timestamp.fromDate(
                                                      DateTime(2000)),
                                                  "RoomUser": "",
                                                  "Email": "",
                                                  "Active": false
                                                  });
                                                }
                                                else {
                                                  await FirebaseFirestore
                                                    .instance
                                                    .collection("Executive Suites")
                                                    .doc(rIds[index])
                                                    .set({
                                                  "EndDate": Timestamp.fromDate(
                                                      DateTime(2000)),
                                                  "StartDate": Timestamp.fromDate(
                                                      DateTime(2000)),
                                                  "RoomUser": "",
                                                  "Email": "",
                                                  "Active": false
                                                  });
                                                }
                                                rIds.removeAt(index);
                                                rStart.removeAt(index);
                                                rEnd.removeAt(index);
                                                rActive.removeAt(index);
                                                rEmails.removeAt(index);
                                                setState(() {});
                                              },
                                              icon: const Icon(
                                                Icons.delete,
                                                color: Colors.red,
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                              )
                              : const Expanded(
                                  child: Center(
                                    child: Text("No reservations made."),
                                  ),
                                ),
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
