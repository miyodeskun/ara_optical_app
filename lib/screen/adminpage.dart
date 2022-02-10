import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:ara_optical_app/const.dart';
import 'package:ara_optical_app/model/user.dart';
import 'loginpage.dart';
import 'tab1.dart';
import 'tab2.dart';
import 'tab3.dart';
import 'tab4.dart';

class AdminPage extends StatefulWidget {
  final User user;
  const AdminPage({Key? key, required this.user}) : super(key: key);

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  double screenHeight = 0.0, screenWidth = 0.0;
  late List<Widget> tabchildren;
  int _currentIndex = 0;
  String maintitle = "Shop";

  @override
  void initState() {
    super.initState();
    tabchildren = [
      TabPage1(user: widget.user),
      TabPage2(user: widget.user),
      TabPage3(user: widget.user),
      TabPage4(user: widget.user),
    ];
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    final items = <Widget>[
      const Icon(Icons.shopping_bag, size: 20),
      const Icon(Icons.shopping_cart, size: 20),
      const Icon(Icons.people_alt, size: 20),
      const Icon(Icons.supervised_user_circle, size: 20),
    ];

    final titles = [
      "Shop",
      "Cart",
      "Profile",
      "Admin",
    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(titles[_currentIndex]),
        backgroundColor: kPrimayColor,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => const LoginPage()));
            },
          ),
        ],
      ),
      body: tabchildren[_currentIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
        ),
        child: CurvedNavigationBar(
          items: items,
          index: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index),
          color: kPrimayColor,
          backgroundColor: Colors.transparent,
          buttonBackgroundColor: kPrimayColor,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 300),
        ),
      ),
    );
  }
}
