import 'package:ara_optical_app/const.dart';
import 'package:ara_optical_app/model/config.dart';
import 'package:ara_optical_app/model/product.dart';
import 'package:ara_optical_app/screen/payment.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final Product product;
  late double screenHeight, screenWidth, resWidth;
  DetailsScreen({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth <= 600) {
      resWidth = screenWidth * 0.85;
    } else {
      resWidth = screenWidth * 0.75;
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios_new)),
            const SizedBox(height: 2),
            Text(
              product.prid! + ". " + product.prname!,
              textAlign: TextAlign.left,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: screenHeight / 3,
                  width: screenWidth,
                  decoration: BoxDecoration(
                    color: kPrimayColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                CachedNetworkImage(
                  fit: BoxFit.fill,
                  height: screenHeight / 3,
                  imageUrl: Config.server +
                      "/araoptical/images/products/" +
                      product.prid! +
                      ".png",
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 5, top: 5),
                  child: Text(
                    "Price:",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(right: 5, top: 5),
                  child: Text(
                    "Quantity:",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5, top: 5),
                  child: Container(
                    decoration: BoxDecoration(
                        color: kPrimayColor,
                        borderRadius: BorderRadius.circular(5.0)),
                    child: Text(
                      "RM " + product.prprice!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                          color: Colors.white),
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 5, top: 5),
                  child: Text(
                    product.prqty! + " units",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.only(left: 5, top: 5),
              child: Text(
                "Description:",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              width: screenWidth,
              margin: const EdgeInsets.only(left: 5, top: 5, bottom: 5),
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(5.0),
                ),
              ),
              child: Text(
                product.prdesc!,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 5, top: 5, bottom: 5),
              child: Text(
                "Product Created:",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5, bottom: 5),
              child: Text(
                product.prdate!,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(height: 30),
            Row(
              children: [
                InkWell(
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                        color: kPrimayColor,
                        borderRadius: BorderRadius.circular(12)),
                    child: const Text(
                      "Buy Now",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => PaymentPage()));
                  },
                ),
                Spacer(),
                IconButton(
                  padding: const EdgeInsets.all(0),
                  tooltip: "Add to cart",
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add_shopping_cart,
                    size: 50,
                    color: kPrimayColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
