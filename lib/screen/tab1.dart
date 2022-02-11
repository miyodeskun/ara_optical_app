import 'dart:convert';
import 'package:ara_optical_app/model/product.dart';
import 'package:ara_optical_app/screen/detailspage.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ara_optical_app/const.dart';
import 'package:ara_optical_app/model/config.dart';
import 'package:ara_optical_app/model/user.dart';
import 'package:http/http.dart' as http;

class TabPage1 extends StatefulWidget {
  final User user;
  const TabPage1({Key? key, required this.user}) : super(key: key);

  @override
  State<TabPage1> createState() => _TabPage1State();
}

class _TabPage1State extends State<TabPage1> {
  List productlist = [];
  String titlecenter = "Loading data...";
  late double screenHeight, screenWidth, resWidth;
  int scrollcount = 10;
  int rowcount = 2;
  int numprd = 0;

  @override
  void initState() {
    super.initState();
    _loadProduct();
  }

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
      body: productlist.isEmpty
          ? Center(
              child: Text(titlecenter,
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold)))
          : Column(
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(8, 20, 8, 10),
                  child: Text(
                    "List Of Product Available",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Flexible(
                  flex: 10,
                  child: GridView.count(
                    crossAxisCount: 2,
                    children: List.generate(
                      productlist.length,
                      (index) {
                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          elevation: 8,
                          child: InkWell(
                            child: Column(
                              children: [
                                CachedNetworkImage(
                                  height: screenHeight / 6,
                                  width: screenWidth / 2,
                                  imageUrl: Config.server +
                                      "/araoptical/images/products/" +
                                      productlist[index]['prid'] +
                                      ".png",
                                  placeholder: (context, url) =>
                                      const CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                                Text(
                                  productlist[index]['prname'],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                Container(
                                  width: screenWidth / 5,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: kPrimayColor,
                                  ),
                                  child: Text(
                                    "RM" + productlist[index]['prprice'],
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Text(productlist[index]['prqty'] + " unit"),
                              ],
                            ),
                            onTap: () {
                              _productDetails(index);
                            },
                          ),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
    );
  }

  _loadProduct() {
    http.post(Uri.parse(Config.server + "/araoptical/php/load_product.php"),
        body: {}).then((response) {
      var data = jsonDecode(response.body);
      if (response.statusCode == 200 && data['status'] == 'success') {
        print(response.body);
        var extractdata = data['data'];
        setState(() {
          productlist = extractdata["products"];
          numprd = productlist.length;
          if (scrollcount >= productlist.length) {
            scrollcount = productlist.length;
          }
        });
      } else {
        setState(() {
          titlecenter = "No Data";
        });
      }
    });
  }

  _productDetails(int index) async {
    Product product = Product(
      prid: productlist[index]['prid'],
      prname: productlist[index]['prname'],
      prdesc: productlist[index]['prdesc'],
      prdate: productlist[index]['prdate'],
      prqty: productlist[index]['prqty'],
      prprice: productlist[index]['prprice'],
      prowner: productlist[index]['prowner'],
    );
    await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => DetailsScreen(
                  product: product,
                )));
  }
}
