import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:front_end/components/funcsnvars.dart';

import '../components/footer.dart';

class ServiceRequest extends StatefulWidget {
  const ServiceRequest({ Key? key }) : super(key: key);

  @override
  State<ServiceRequest> createState() => _ServiceRequestState();
}

class _ServiceRequestState extends State<ServiceRequest> {
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
                          "Service Request Viewer",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: height / 1.5,
                          width: width / 2,
                          child: sEmails.isNotEmpty?ListView.builder(
                            padding: const EdgeInsets.all(8),
                            itemCount: sEmails.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ExpansionTile(
                                title: Row(
                                  children: [
                                    Text(sEmails[index]),
                                    const Spacer(),
                                    IconButton(
                                      onPressed: () async {
                                        await FirebaseFirestore.instance
                                            .collection("Service Requests")
                                            .doc(sIds[index])
                                            .delete();
                                        sIds.removeAt(index);
                                        sEmails.removeAt(index);
                                        sTypes.removeAt(index);
                                        sDescriptions.removeAt(index);
                                        setState(() {});
                                      },
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ],
                                ),
                                subtitle: Text(sTypes[index]),
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(sDescriptions[index]),
                                  ),
                                ],
                              );
                            },
                          ):const Expanded(
                                  child: Center(
                                    child:
                                        Text("No pending service requests."),
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