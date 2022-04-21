import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:front_end/components/funcsnvars.dart';

import '../components/footer.dart';

class ManageAdmin extends StatefulWidget {
  const ManageAdmin({Key? key}) : super(key: key);

  @override
  State<ManageAdmin> createState() => _ManageAdminState();
}

class _ManageAdminState extends State<ManageAdmin> {
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passController = TextEditingController();
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
                          "Admin Management",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: height / 1.5,
                          width: width / 2,
                          child: adminIds.length != 1
                              ? ListView.builder(
                                  padding: const EdgeInsets.all(8),
                                  itemCount: adminIds.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    if (adminEmail != adminIds[index]) {
                                      return ListTile(
                                        title: Row(
                                          children: [
                                            Text(adminIds[index]),
                                            const Spacer(),
                                            IconButton(
                                              onPressed: () async {
                                                await FirebaseFirestore.instance
                                                    .collection("Admins")
                                                    .doc(adminIds[index])
                                                    .delete();
                                                adminIds.removeAt(index);
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
                                    } else {
                                      return const SizedBox();
                                    }
                                  },
                                )
                              : const Expanded(
                                  child: Center(
                                    child:
                                        Text("No other admin accounts active."),
                                  ),
                                ),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    content: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
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
                                            "Add Admin",
                                            style: TextStyle(
                                              color: Colors.amber,
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          TextField(
                                            controller: emailController,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              labelText: "Enter Email",
                                            ),
                                          ),
                                          TextField(
                                            controller: passController,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              labelText: "Enter Password",
                                            ),
                                            obscureText: true,
                                          ),
                                          const SizedBox(),
                                          ElevatedButton(
                                            onPressed: () async {
                                              if (emailController
                                                  .text.isNotEmpty) {
                                                if (passController
                                                    .text.isNotEmpty) {
                                                  FirebaseFirestore.instance
                                                      .collection("Admins")
                                                      .doc(emailController.text)
                                                      .set({
                                                    "pass": passController.text,
                                                  });
                                                  adminIds.add(
                                                      emailController.text);
                                                  emailController.clear();
                                                  passController.clear();
                                                  Navigator.pop(context);
                                                } else {
                                                  showDialog(
                                                    context: context,
                                                    builder: (context) {
                                                      return const AlertDialog(
                                                        title: Text(
                                                            "Password cannot be empty!"),
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
                                                          "Email cannot be empty!"),
                                                    );
                                                  },
                                                );
                                              }
                                            },
                                            child: const Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Text(
                                                "SAVE",
                                                style: TextStyle(fontSize: 20),
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
                            child: Text(
                              "Add Admin",
                              style: TextStyle(fontSize: 20),
                            ))
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
