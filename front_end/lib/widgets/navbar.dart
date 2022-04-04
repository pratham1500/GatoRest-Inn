import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        child: Row(
          children: [
            SizedBox(
                height: 80,
                width: 150,
                child: Image.asset('assets/images/logo.png')),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                _NavBarItem(title: "Home Page"),
                SizedBox(
                  width: 60,
                ),
              ],
            )
          ],
        ));
  }
}

class _NavBarItem extends StatelessWidget {
  final String title;
  const _NavBarItem({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontSize: 18),
    );
  }
}
