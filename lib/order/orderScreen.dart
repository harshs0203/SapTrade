import 'package:flutter/material.dart';
import 'package:sap_trade/order/components/BottomNavigationBar.dart';
import 'package:sap_trade/order/components/body.dart';

class Order extends StatefulWidget {
  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      bottomNavigationBar: BottomBar(),
    );
  }
}
