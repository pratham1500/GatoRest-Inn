import 'package:flutter/material.dart';
import '../widgets/navbar_item.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Image.asset("assets/images/logo.png"),
          const Spacer(),
          NavBarItem(
            itemName: "HOME",
            press: () {},
          ),
          NavBarItem(
            itemName: "OUR LOCATIONS",
            press: () {},
          ),
          NavBarItem(
            itemName: "AMENITIES",
            press: () {},
          ),
          NavBarItem(
            itemName: "CONTACT US",
            press: () {},
          ),
          NavBarItem(
            itemName: "AVAILABILITY",
            press: () {},
          ),
          NavBarItem(
            itemName: "LOGIN",
            press: () {},
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: TextButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(const EdgeInsets.all(15)),
                backgroundColor: MaterialStateProperty.all(Colors.amber),
              ),
              onPressed: () {},
              child: const Text(
                "SIGN UP",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
