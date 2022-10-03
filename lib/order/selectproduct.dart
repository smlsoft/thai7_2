import 'package:intl/intl.dart';
import 'dart:developer';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:thai7/datademo.dart';
import 'package:thai7/model/product.dart';
import 'package:thai7/global.dart' as global;
import 'package:thai7/order/orderscreen.dart';
import 'package:thai7/order/productcard.dart';
import 'package:thai7/painter/recommend.dart';
import 'package:thai7/painter/starpersent.dart';

class SelectProduct extends StatefulWidget {
  const SelectProduct({super.key});

  @override
  State<SelectProduct> createState() => _SelectProductState();
}

class _SelectProductState extends State<SelectProduct>
    with SingleTickerProviderStateMixin {
  late ScrollController _scrollController;

  Widget listProduct() {
    return Column(children: [
      ElevatedButton(
          onPressed: () {
            setState(() {
              global.products.clear();
              dataDemo(addUnit: false);
              log(global.products.length.toString());
            });
          },
          child: const Text('Select')),
      Expanded(
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            controller: _scrollController,
            physics: const AlwaysScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: global.products.length,
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const OrderScreen()),
                    );
                  },
                  child: productCard(mode: 0, product: global.products[index]));
            }),
      )
    ]);
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController(
      initialScrollOffset: 0.0,
      keepScrollOffset: true,
    );
    _scrollController.addListener(() {
      if (_scrollController.offset >=
              _scrollController.position.maxScrollExtent &&
          !_scrollController.position.outOfRange) {
        setState(() {
          log("reach the bottom");
          dataDemo(addUnit: false);
          dataDemo(addUnit: false);
          dataDemo(addUnit: false);
          dataDemo(addUnit: false);
          dataDemo(addUnit: false);
          dataDemo(addUnit: false);
          dataDemo(addUnit: false);
          dataDemo(addUnit: false);
          dataDemo(addUnit: false);
          dataDemo(addUnit: false);
          dataDemo(addUnit: false);
          dataDemo(addUnit: false);
          log(global.products.length.toString());
        });
      }
      if (_scrollController.offset <=
              _scrollController.position.minScrollExtent &&
          !_scrollController.position.outOfRange) {
        setState(() {
          log("reach the top");
        });
      }
    });
    dataDemo();
    for (int loop = 0; loop < 121; loop++) {
      dataDemo(addUnit: false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return listProduct();
  }
}
