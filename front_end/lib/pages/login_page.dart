import 'package:flutter/material.dart';
import 'package:front_end/components/funcsnvars.dart';
import 'package:front_end/pages/home_page.dart';
import 'package:front_end/pages/signup_page.dart';

import '../components/footer.dart';
import '../components/navbar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailController = TextEditingController();
  var passController = TextEditingController();
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
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white.withOpacity(.95),
                    ),
                    padding: const EdgeInsets.all(30),
                    height: height / 2,
                    width: width / 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          "Login",
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
                              borderRadius: BorderRadius.circular(15),
                            ),
                            labelText: "Enter Email",
                          ),
                        ),
                        TextField(
                          controller: passController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            labelText: "Enter Password",
                          ),
                          obscureText: true,
                        ),
                        const SizedBox(),
                        ElevatedButton(
                          onPressed: () async {
                            if (emailController.text.isNotEmpty) {
                              if (passController.text.isNotEmpty) {
                                await signInWithEmailPassword(
                                    emailController.text, passController.text);
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return const AlertDialog(
                                      title: Text("Password cannot be empty!"),
                                    );
                                  },
                                );
                              }
                            } else {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return const AlertDialog(
                                    title: Text("Email cannot be empty!"),
                                  );
                                },
                              );
                            }
                            if (isSignedIn) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomePage(),
                                ),
                              );
                            } else {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text(errorText),
                                  );
                                },
                              );
                            }
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "LOG IN",
                              style: TextStyle(fontSize: 20),
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
