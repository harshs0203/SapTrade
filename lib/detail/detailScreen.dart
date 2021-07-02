import 'package:flutter/material.dart';
import 'package:sap_trade/detail/components/body.dart';
import 'package:sap_trade/modals/sellers.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key key, this.listSeller, this.index}) : super(key: key);

  final List listSeller;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(listSeller: listSeller, index: index),
    );
  }
}

