import 'package:ara_optical_app/const.dart';
import 'package:ara_optical_app/model/product.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../model/config.dart';
import '../model/product.dart';

class PaymentPage extends StatelessWidget {
  final Product product;
  late double screenHeight, screenWidth, resWidth;
  PaymentPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Product product;
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Payment"),
        backgroundColor: kPrimayColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              "Your Item: ",
              style: TextStyle(fontSize: 18),
            ),
          ),
          Container(
            height: 200,
            decoration: BoxDecoration(),
            child: Column(
              children: [
                CachedNetworkImage(
                  fit: BoxFit.fill,
                  height: screenHeight / 3,
                  imageUrl:
                      Config.server + "/araoptical/images/products/" + ".png",
                ),
              ],
            ),
          ),
          Text("lmao"),
        ],
      ),
    );
  }
}
