import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  double screenHeight = 0.0, screenWidth = 0.0;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'About Us',
                style: TextStyle(fontFamily: 'League Spartan', fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                  "Address: Lot 37, Varsity Mall, Universiti Utara Malaysia, 06010, Sintok, Kedah"),
              const SizedBox(
                height: 10,
              ),
              const Text("Phone: 017-9093934"),
              const SizedBox(
                height: 10,
              ),
              const Text(
                  "Operation Hours: 10.00am - 4:00p.m (Monday - Sunday)"),
              IconButton(
                onPressed: () => Navigator.pop(context, false),
                icon: const Icon(Icons.arrow_back),
              )
            ]),
      ),
    );
  }
}
