import 'package:ara_optical_app/screen/aboutpage.dart';
import 'package:flutter/material.dart';
import 'package:ara_optical_app/model/user.dart';
import 'package:ara_optical_app/screen/loginpage.dart';
import 'historypage.dart';
import 'registerpage.dart';

class TabPage3 extends StatefulWidget {
  final User user;
  const TabPage3({Key? key, required this.user}) : super(key: key);

  @override
  _TabPage3State createState() => _TabPage3State();
}

class _TabPage3State extends State<TabPage3> {
  late double screenHeight, screenWidth, resWidth;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth <= 600) {
      resWidth = screenWidth * 0.85;
    } else {
      resWidth = screenWidth * 0.75;
    }

    return Center(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 20),
        const Text(
          "Welcome back!",
          style: TextStyle(fontSize: 20),
        ),
        Text(
          widget.user.name!,
          style: TextStyle(fontSize: 40),
        ),
        const SizedBox(
          height: 20,
        ),
        ListView(
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            shrinkWrap: true,
            children: [
              MaterialButton(
                onPressed: _registerAccountDialog,
                child: const Text("NEW REGISTRATION"),
              ),
              const Divider(
                height: 2,
              ),
              MaterialButton(
                onPressed: _loginDialog,
                child: const Text("LOGIN"),
              ),
              const Divider(
                height: 2,
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PaymentHistory()));
                },
                child: const Text("PAYMENT HISTORY"),
              ),
              const Divider(
                height: 2,
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AboutPage()));
                },
                child: const Text("ABOUT US"),
              ),
              const Divider(
                height: 2,
              ),
            ]),
      ],
    ));
  }

  void _registerAccountDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          title: const Text(
            "Register Account",
            textAlign: TextAlign.center,
            style: TextStyle(),
          ),
          content: const Text(
            "Are you sure?",
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                "Yes",
                style: TextStyle(),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const RegisterPage()));
              },
            ),
            TextButton(
              child: const Text(
                "No",
                style: TextStyle(),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _loginDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          title: const Text(
            "Go to Login Page",
            textAlign: TextAlign.center,
            style: TextStyle(),
          ),
          content: const Text(
            "Are you sure?",
            textAlign: TextAlign.center,
            style: TextStyle(),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                "Yes",
                style: TextStyle(),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => const LoginPage()));
              },
            ),
            TextButton(
              child: const Text(
                "No",
                style: TextStyle(),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
