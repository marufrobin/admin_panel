import 'package:admin_panel/customhttp/custom_http.dart';
import 'package:flutter/cupertino.dart';

import '../model/order_model.dart';

class OrderProvider with ChangeNotifier {
  List<OrderModel> orderList = [];

  getOrderListData() async {
    orderList = await CustomHttp.fatchingData();
    notifyListeners();
  }
}
