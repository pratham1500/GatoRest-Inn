import 'package:flutter/material.dart';
import '../components/footer.dart';
import '../components/navbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                  const Spacer(
                    flex: 2,
                  ),
                  Stack(
                    children: <Widget>[
                      Text(
                        "The GatoRest Inn",
                        style: TextStyle(
                          fontSize: 75,
                          fontStyle: FontStyle.italic,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 3
                            ..color = Colors.black,
                        ),
                      ),
                      const Text(
                        "The GatoRest Inn",
                        style: TextStyle(
                          fontSize: 75,
                          fontStyle: FontStyle.italic,
                          color: Colors.amber,
                        ),
                      ),
                    ],
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
