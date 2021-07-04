import 'package:flutter/material.dart';
import 'package:sap_trade/order/components/BottomNavigationBar.dart';

class Order extends StatefulWidget {
  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomBar(),
    );
  }
}
