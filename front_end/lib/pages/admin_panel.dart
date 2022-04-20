import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:front_end/components/funcsnvars.dart';
import 'package:front_end/pages/query_view.dart';

import '../components/footer.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
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
                          "Admin Panel",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () {},
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
                              onPressed: () {},
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
                                    "Manage Service Requests",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
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
                                    "Manage Food Orders",
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
                                qids = [];
                                qnames = [];
                                qemails = [];
                                queries = [];
                                await FirebaseFirestore.instance
                                    .collection("Queries")
                                    .get()
                                    .then(
                                  (snapshot) {
                                    for (var document in snapshot.docs) {
                                      qids.add(document.id);
                                      qnames.add(document['name']);
                                      qemails.add(document['email']);
                                      queries.add(document['query']);
                                    }
                                  },
                                );
                                Navigator.pop(context);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const QueryView(),
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
                                    "View Queries",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
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
                                    "Manage Admins",
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
