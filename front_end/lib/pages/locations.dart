import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../components/footer.dart';
import '../components/navbar.dart';

class LocationsPage extends StatefulWidget {
  const LocationsPage({Key? key}) : super(key: key);

  @override
  State<LocationsPage> createState() => _LocationsPageState();
}

class _LocationsPageState extends State<LocationsPage> {
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
                      color: Colors.white.withOpacity(.95),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    height: height / 1.3,
                    width: width / 1.3,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          "Welcome!",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          "We currently only have one location, but we will be expanding soon!",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: SizedBox(
                            height: height / 2,
                            width: width / 2,
                            child: FlutterMap(
                              options: MapOptions(
                                center: LatLng(
                                    29.64957651305397, -82.34728203920992),
                                zoom: 15,
                              ),
                              layers: [
                                TileLayerOptions(
                                  urlTemplate:
                                      "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                                  subdomains: ['a', 'b', 'c'],
                                ),
                                MarkerLayerOptions(
                                  markers: [
                                    Marker(
                                      width: 80.0,
                                      height: 80.0,
                                      point: LatLng(29.64957651305397,
                                          -82.34728203920992),
                                      builder: (context) => const Icon(Icons.pin_drop),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Text(
                          "FLG-0270, Florida Gymnasium, University of Florida",
                          style: TextStyle(
                            fontSize: 15,
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
