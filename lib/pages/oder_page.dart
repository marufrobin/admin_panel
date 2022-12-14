import 'package:admin_panel/widget/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

import '../provider/order_provider.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  void initState() {
    Provider.of<OrderProvider>(context, listen: false).getOrderListData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List orderList = Provider.of<OrderProvider>(context).orderList;
    return orderList.isEmpty
        ? Center(
            child: LoadingAnimationWidget.dotsTriangle(
              color: Colors.blue,
              size: 60,
            ),
          )
        : Scaffold(
            appBar: AppBar(
              title: Text(
                "Order",
                style: buildTextStyle(26, Colors.white, FontWeight.bold),
              ),
            ),
            body: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true, scrollDirection: Axis.vertical,
                  // physics: NeverScrollableScrollPhysics(),
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 60,
                      height: 60,
                      child: Text("Order Id: ${orderList[index].id}"),
                    );
                  },
                )
              ],
            ),
          );
  }
}
