import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:front_end/components/funcsnvars.dart';
import 'package:url_launcher/url_launcher.dart';
import '../components/footer.dart';
import '../components/navbar.dart';

class QueryView extends StatefulWidget {
  const QueryView({Key? key}) : super(key: key);

  @override
  State<QueryView> createState() => _QueryViewState();
}

class _QueryViewState extends State<QueryView> {
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
                    height: height / 1.2,
                    width: width / 1.2,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          "Query Viewer",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          height: height / 1.5,
                          width: width / 2,
                          child: ListView.builder(
                            padding: const EdgeInsets.all(8),
                            itemCount: qids.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ExpansionTile(
                                title: Row(
                                  children: [
                                    Text(qnames[index]),
                                    Spacer(),
                                    IconButton(
                                      onPressed: () {
                                        launch(
                                            'mailto:${qemails[index]}?subject=Query Response');
                                      },
                                      icon: Icon(
                                        Icons.reply,
                                        color: Colors.black,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () async {
                                        await FirebaseFirestore.instance
                                            .collection("Queries")
                                            .doc(qids[index])
                                            .delete();
                                        qids.removeAt(index);
                                        qnames.removeAt(index);
                                        qemails.removeAt(index);
                                        queries.removeAt(index);
                                        setState(() {});
                                      },
                                      icon: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ],
                                ),
                                subtitle: Text(qemails[index]),
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(queries[index]),
                                  ),
                                ],
                              );
                            },
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
