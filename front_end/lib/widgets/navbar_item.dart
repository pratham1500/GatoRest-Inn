import 'package:flutter/material.dart';

class NavBarItem extends StatelessWidget {
  final String itemName;
  final Function press;
  const NavBarItem({
    Key? key,
    required this.itemName,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Text(
          itemName,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}