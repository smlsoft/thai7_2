import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:thai7/model/product.dart';
import 'package:thai7/order/orderscreen.dart';
import 'package:thai7/painter/recommend.dart';
import 'package:thai7/painter/starpersent.dart';

Widget productCard({required int mode, required ProductModel product}) {
  final formatMoney = NumberFormat.currency(locale: "th_TH", symbol: "฿");
  final formatPersent = NumberFormat.percentPattern();
  final List<Image> images = [];
  final PageController imagePageViewController = PageController();
  int imageCurrentPageValue = 0;

  if (mode == 1) {
    for (var i = 0; i < product.images.length; i++) {
      images.add(Image.network(product.images[i].uri));
    }
  }
  List<Widget> extra = [];
  if (product.recommended) {
    extra.add(recommendTag(width: 40, height: 40, header: "ลด", title: "50%"));
    if (extra.isNotEmpty) extra.add(const SizedBox(width: 2));
    extra.add(
        recommendTag(width: 40, height: 40, header: "ขนส่ง", title: "ฟรี"));
  }
  double discountPersent = 0.0;
  if (product.price != product.normalprice) {
    double diffPrice = product.normalprice - product.price;
    discountPersent = (diffPrice / product.price);
  }
  return Card(
    child: Stack(children: [
      Column(children: [
        Expanded(
          child: SizedBox(
            width: double.infinity,
            child: (mode == 0)
                ? CachedNetworkImage(
                    progressIndicatorBuilder: (context, url, progress) =>
                        Center(
                      child: CircularProgressIndicator(
                        value: progress.progress,
                      ),
                    ),
                    imageUrl: product.images[0].uri,
                  )
                : Column(children: [
                    Expanded(
                        child: PageView(
                      controller: imagePageViewController,
                      children: images,
                      onPageChanged: (int index) {
                        imageCurrentPageValue = index;
                      },
                    )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (var i = 0; i < product.images.length; i++)
                          GestureDetector(
                              onTap: () {
                                imagePageViewController.animateToPage(i,
                                    duration: const Duration(milliseconds: 200),
                                    curve: Curves.easeIn);
                              },
                              child: Container(
                                width: 40,
                                height: 40,
                                margin: const EdgeInsets.all(5),
                                child: Image.network(product.images[i].uri),
                              ))
                      ],
                    ),
                  ]),
          ),
        ),
        Column(
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: Text(product.name1,
                    style: const TextStyle(
                      fontSize: 12,
                    ))),
            Row(children: [
              Expanded(
                  child: Text(
                      (product.pricerangemin != product.pricerangemax)
                          ? formatMoney.format(product.price)
                          : "${formatMoney.format(product.pricerangemin)} - ${formatMoney.format(product.pricerangemax)}",
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.bold,
                        shadows: <Shadow>[
                          Shadow(
                            offset: Offset(1.0, 1.0),
                            blurRadius: 3.0,
                            color: Colors.white,
                          ),
                          Shadow(
                            offset: Offset(1.0, 1.0),
                            blurRadius: 8.0,
                            color: Colors.deepOrange,
                          ),
                        ],
                      ))),
              const Image(
                  width: 30,
                  image: AssetImage("assets/icons/freeshipping.png")),
            ]),
            if (discountPersent != 0.0)
              Row(children: [
                Text(formatMoney.format(product.normalprice),
                    style: const TextStyle(
                      decoration: TextDecoration.lineThrough,
                      fontSize: 12,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(1.0, 1.0),
                          blurRadius: 3.0,
                          color: Colors.white,
                        ),
                        Shadow(
                          offset: Offset(1.0, 1.0),
                          blurRadius: 8.0,
                          color: Colors.white,
                        ),
                      ],
                    )),
                const SizedBox(width: 5),
                Text("-${formatPersent.format(discountPersent)}",
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(1.0, 1.0),
                          blurRadius: 3.0,
                          color: Colors.white,
                        ),
                        Shadow(
                          offset: Offset(1.0, 1.0),
                          blurRadius: 8.0,
                          color: Colors.white,
                        ),
                      ],
                    ))
              ]),
            Row(children: [
              starPersent(persent: product.starpersent),
              const SizedBox(width: 5),
              Text("(${product.ordercount})")
            ]),
          ],
        )
      ]),
      if (product.shoprecommended)
        Positioned(
            top: 0,
            left: 0,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.red.shade100,
                borderRadius: const BorderRadius.all(Radius.circular(2)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: const Text('ร้านแนะนำ',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset(1.0, 1.0),
                        blurRadius: 3.0,
                        color: Colors.white,
                      ),
                      Shadow(
                        offset: Offset(1.0, 1.0),
                        blurRadius: 8.0,
                        color: Colors.white,
                      ),
                    ],
                  )),
            )),
      if (extra.isNotEmpty)
        Positioned(top: 0, right: 0, child: Row(children: extra)),
    ]),
  );
}
