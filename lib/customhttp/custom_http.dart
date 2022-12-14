import 'dart:convert';

import 'package:admin_panel/model/order_model.dart';
import 'package:admin_panel/widget/common_widget.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CustomHttp {
  static Future<Map<String, String>> getHeaderWithToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var header = {
      "Accept": "Application/json",
      "Authorization": "bearer${sharedPreferences.getString("token")}"
    };
    print("Printing token from Header:::::${sharedPreferences.get("token")}");
    return header;
  }

  static Future<List<OrderModel>> fatchingData() async {
    List<OrderModel> orderList = [];
    OrderModel orderModel;
    String orderLink = "${baseUrl}/all/orders";
    var responce = await http.get(Uri.parse(orderLink),
        headers: await CustomHttp.getHeaderWithToken());
    var data = jsonDecode(responce.body);
    for (var i in data) {
      orderModel = OrderModel.fromJson(i);
      orderList.add(orderModel);
    }
    return orderList;
  }
}
