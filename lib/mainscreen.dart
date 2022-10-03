import 'package:intl/intl.dart';
import 'dart:developer';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:thai7/model/product.dart';
import 'package:thai7/global.dart' as global;
import 'package:thai7/order/selectproduct.dart';
import 'package:thai7/painter/recommend.dart';
import 'package:thai7/painter/starpersent.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Thai 7'),
          ),
          body: Center(
            child: TabBarView(
              controller: _tabController,
              children: [
                const SelectProduct(),
                Container(),
                Container(),
                Container(),
                Container()
              ],
            ),
          ),
          bottomNavigationBar: ConvexAppBar(
            controller: _tabController,
            items: const [
              TabItem(icon: Icons.home, title: 'หน้าหลัก'),
              TabItem(icon: Icons.production_quantity_limits, title: 'สินค้า'),
              TabItem(icon: Icons.shopping_basket, title: 'ตระกร้า'),
              TabItem(icon: Icons.history, title: 'ประวัติ'),
              TabItem(icon: Icons.account_circle, title: 'บัญชี'),
            ],
            onTap: (int i) => setState(() {
              _selectedIndex = i;
            }),
          ),
        ));
  }
}
