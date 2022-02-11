class Product {
  String? prid;
  String? prowner;
  String? prname;
  String? prdesc;
  String? prprice;
  String? prqty;
  String? prdate;

  Product(
      {required this.prid,
      required this.prname,
      required this.prowner,
      required this.prdesc,
      required this.prprice,
      required this.prqty,
      required this.prdate});

  Product.fromJson(Map<String, dynamic> json) {
    prid = json['prid'];
    prname = json['prname'];
    prowner = json['prowner'];
    prdesc = json['prdesc'];
    prprice = json['prprice'];
    prqty = json['prqty'];
    prdate = json['prdate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['prid'] = prid;
    data['prname'] = prname;
    data['prowner'] = prowner;
    data['prdesc'] = prdesc;
    data['prprice'] = prprice;
    data['prqty'] = prqty;
    data['prdate'] = prdate;
    return data;
  }
}
