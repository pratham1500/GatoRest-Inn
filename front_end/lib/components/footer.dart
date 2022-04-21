import 'package:flutter/material.dart';
import 'package:front_end/pages/admin_login.dart';
import 'package:front_end/pages/contact_us.dart';
import 'package:front_end/pages/home_page.dart';
import 'package:front_end/pages/locations.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatefulWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height / 4;
    var width = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.blueGrey[100],
      height: height,
      child: Row(
        children: [
          SizedBox(
            width: width / 3,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "GatoRest Inn",
                    style: TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  Text(
                    "The home for Gators.",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: height / 3,
                width: width / 6,
                child: const Center(
                  child: Text(
                    "Explore",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height / 4.5,
                width: width / 6,
                child: Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()));
                    },
                    child: const Text(
                      "Home",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(
                height: height / 3,
                width: width / 6,
                child: const Center(
                  child: Text(
                    "Visit",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height / 2.25,
                width: width / 6,
                child: Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LocationsPage()));
                    },
                    child: const Text(
                      "FLG-0270, Florida Gymnasium, University of Florida",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
          Column(
            children: [
              SizedBox(
                height: height / 3,
                width: width / 6,
                child: const Center(
                  child: Text(
                    "Connect With Us",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height / 4.5,
                width: width / 6,
                child: Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ContactUsPage(),
                        ),
                      );
                    },
                    child: const Text(
                      "Contact Us",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height / 4.5,
                width: width / 6,
                child: Center(
                  child: TextButton(
                    onPressed: () {
                      launch('tel:180042867378');
                    },
                    child: const Text(
                      "1800-GATOREST",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height / 4.5,
                width: width / 6,
                child: Center(
                  child: TextButton(
                    onPressed: () {
                      launch('mailto:info@gatorestinn.com');
                    },
                    child: const Text(
                      "info@gatorestinn.com",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(
                height: height / 3,
                width: width / 6,
                child: const Center(
                  child: Text(
                    "Admin",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height / 4.5,
                width: width / 6,
                child: Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AdminLoginPage()));
                    },
                    child: const Text(
                      "Admin Login",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}
