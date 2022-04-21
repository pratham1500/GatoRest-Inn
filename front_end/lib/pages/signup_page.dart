import 'package:flutter/material.dart';
import 'package:front_end/components/funcsnvars.dart';
import 'package:front_end/pages/home_page.dart';
import '../components/footer.dart';
import '../components/navbar.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  var emailController = TextEditingController();
  var passController = TextEditingController();
  var retypeController = TextEditingController();
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
                          "Signup",
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
                            labelText: "Enter Username",
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
                        TextField(
                          controller: retypeController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            labelText: "Re-enter Password",
                          ),
                          obscureText: true,
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            if (emailController.text.isNotEmpty) {
                              if (passController.text.isNotEmpty) {
                                if (retypeController.text ==
                                    passController.text) {
                                  await registerWithEmailPassword(
                                      emailController.text,
                                      passController.text);
                                } else {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return const AlertDialog(
                                        title: Text("Passwords mismatched!"),
                                      );
                                    },
                                  );
                                }
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
                              "SIGN UP",
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
