import 'dart:developer';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thai7/datademo.dart';
import 'package:thai7/global.dart' as global;
import 'package:thai7/model/product.dart';
import 'package:thai7/order/productcard.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen>
    with SingleTickerProviderStateMixin {
  ProductModel product = dataProduct();

  int _selectedIndex = 0;
  List<double> orderByPackQty = [];
  String balanceQty = "";

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < product.unituses.length; i++) {
      orderByPackQty.add(0);
    }
  }

  Widget images() {
    return SizedBox(
        height: 400,
        width: double.infinity,
        child: Column(children: [
          Expanded(
              child: SizedBox(
                  height: 500,
                  width: double.infinity,
                  child: productCard(mode: 1, product: product))),
        ]));
  }

  String findUnitName(String unitCode) {
    String result = "";

    for (int i = 0; i < global.units.length; i++) {
      if (global.units[i].unitcode == unitCode) {
        result = global.units[i].unitname1;
        break;
      }
    }
    return result;
  }

  void optionFindDetail(List<ProductOptionDetailIncludeModel> includes) {
    for (int i = 0; i < product.options.length; i++) {
      for (int j = 0; j < product.options[i].optiondetails.length; j++) {
        int foundIndex = -1;
        for (int k = 0; k < includes.length; k++) {
          //log(includes[k].optionguid);
          if (product.options[i].optiondetails[j].optiondetailcode ==
              includes[k].optionguid) {
            foundIndex = k;
            break;
          }
        }
        if (foundIndex != -1) {
          product.options[i].optiondetails[j].isenable = true;
          if (product.options[i].optiondetails[j].selected) {
            if (includes[foundIndex].choicedetails != null) {
              optionFindDetail(includes[foundIndex].choicedetails!);
            }
          }
        }
      }
    }
  }

  void optionFind(List<ProductOptionDetailIncludeModel> includes) {
    for (int k = 0; k < includes.length; k++) {
      if (includes[k].choicedetails != null)
        optionFindDetail(includes[k].choicedetails!);
    }
  }

  void optionsProcess(
      int optionRowIndex, List<ProductOptionDetailIncludeModel> includes) {
    //log(includes.length.toString());

    for (int i = optionRowIndex + 1; i < product.options.length; i++) {
      for (int j = 0; j < product.options[i].optiondetails.length; j++) {
        product.options[i].optiondetails[j].isenable = false;
      }
    }
    // หาตัวเริ่มต้นก่อน
    if (product.options.isNotEmpty) {
      ProductOptionModel option = product.options[0];
      for (int i = 0; i < option.optiondetails.length; i++) {
        if (option.optiondetails[i].selected) {
          optionFind(option.optiondetails[i].choicedetails);
          break;
        }
      }
    }
  }

  Widget options() {
    List<Widget> widget = [];
    List<Widget> imageOptions = [];
    List<Widget> textOptions = [];
    List<String> selectValue = [];
    imageOptions.clear();
    List<ProductOptionModel> arrOptionMaster = [];
    List<String> arrOption = [];
    for (int i = 0; i < product.options.length; i++) {
      for (int j = 0; j < product.options[i].optiondetails.length; j++) {
        if (product.options[i].optiondetails[j].selected) {
          textOptions.add(Text(product.options[i].name1,
              style: const TextStyle(fontSize: 12, color: Colors.grey)));
          textOptions.add(const SizedBox(
            width: 2,
          ));
          textOptions.add(Text(product.options[i].optiondetails[j].name1,
              style: const TextStyle(fontSize: 12, color: Colors.black)));
          textOptions.add(const SizedBox(
            width: 10,
          ));
          if (product.options[i].isstockcontrol) {
            selectValue
                .add(product.options[i].optiondetails[j].optiondetailcode);
          }

          if (product.options[i].optiondetails[j].image.isNotEmpty) {
            imageOptions.add(OutlinedButton(
                style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.all(0),
                    side: BorderSide(
                        width: 2.0,
                        color: (product.options[i].optiondetails[j].selected)
                            ? Colors.white
                            : Colors.grey.shade300),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0))),
                onPressed: () {
                  setState(() {});
                },
                child: Container(
                  margin: const EdgeInsets.only(right: 3, left: 3),
                  child: SizedBox(
                      width: 75,
                      height: 75,
                      child: CachedNetworkImage(
                        fit: BoxFit.fill,
                        progressIndicatorBuilder: (context, url, progress) =>
                            Center(
                          child: CircularProgressIndicator(
                            value: progress.progress,
                          ),
                        ),
                        imageUrl: product.options[i].optiondetails[j].image,
                      )),
                )));
          }
        }
      }
    }

    print(selectValue);
    if (product.availablepatternoptions.length > 0) {
      if (selectValue.length ==
          product.availablepatternoptions[0].optionpatterntags.length) {
        String selectString = "";
        for (int i = 0; i < selectValue.length; i++) {
          if (i == 0) {
            selectString += selectValue[i];
          } else {
            selectString += ":" + selectValue[i];
          }
        }
        print(selectString);
        AvailablePatternOptions dataStock = product.availablepatternoptions
            .firstWhere((ele) => ele.patternkey == selectString,
                orElse: () => AvailablePatternOptions(
                    patternkey: "", qty: 0, price: 0, optionpatterntags: []));

        if (dataStock.patternkey != "") {
          setState(() {
            if (product.unituses.length > 1) {
              balanceQty =
                  dataStock.qty.toString() + " " + product.unit.unitname1;
            } else {
              balanceQty =
                  dataStock.qty.toString() + " " + product.unit.unitname1;
            }
            print(balanceQty);
          });
        }
      } else {
        setState(() {
          balanceQty = "";
        });
      }
    }

    if (imageOptions.isNotEmpty || textOptions.isNotEmpty) {
      widget.add(Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blueAccent),
          ),
          child: Column(children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: imageOptions),
            Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: textOptions)
          ])));
    }
    for (int i = 0; i < product.options.length; i++) {
      List<Widget> details = [];
      for (int j = 0; j < product.options[i].optiondetails.length; j++) {
        if (i == 0) {
          product.options[i].optiondetails[j].isenable = true;
        }
        details.add(OutlinedButton(
            style: OutlinedButton.styleFrom(
                backgroundColor: (product.options[i].optiondetails[j].isenable)
                    ? Colors.white
                    : Colors.grey.shade300,
                padding: const EdgeInsets.all(0),
                side: BorderSide(
                    width: 2.0,
                    color: (product.options[i].optiondetails[j].selected)
                        ? Colors.orange.shade300
                        : Colors.grey.shade300),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0))),
            onPressed: () {
              setState(() {
                if (product.options[i].optiondetails[j].isenable) {
                  for (int c = 0;
                      c < product.options[i].optiondetails.length;
                      c++) {
                    if (c != j) {
                      product.options[i].optiondetails[c].selected = false;
                    }
                  }
                  product.options[i].optiondetails[j].selected =
                      !product.options[i].optiondetails[j].selected;
                  optionsProcess(
                      i, product.options[i].optiondetails[j].choicedetails);
                  for (int i = 1; i < product.options.length; i++) {
                    for (int j = 0;
                        j < product.options[i].optiondetails.length;
                        j++) {
                      if (product.options[i].optiondetails[j].isenable ==
                          false) {
                        product.options[i].optiondetails[j].selected = false;
                      }
                    }
                  }
                }
              });
            },
            child: (product.options[i].optiondetails[j].image.isEmpty)
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(product.options[i].optiondetails[j].name1 +
                        " " +
                        product.options[i].optiondetails[j].optiondetailcode),
                  )
                : Column(children: [
                    SizedBox(
                        width: 75,
                        height: 75,
                        child: CachedNetworkImage(
                          fit: BoxFit.fill,
                          progressIndicatorBuilder: (context, url, progress) =>
                              Center(
                            child: CircularProgressIndicator(
                              value: progress.progress,
                            ),
                          ),
                          imageUrl: product.options[i].optiondetails[j].image,
                        )),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(product.options[i].optiondetails[j].name1 +
                          " " +
                          product.options[i].optiondetails[j].optiondetailcode),
                    )
                  ])));
      }
      widget.add(Container(
        margin: EdgeInsets.only(top: 5),
        child: Row(
          children: [
            Expanded(flex: 1, child: Text(product.options[i].name1)),
            Expanded(flex: 3, child: Wrap(spacing: 7, children: details))
          ],
        ),
      ));
    }
    return Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: widget,
        ));
  }

  Widget packings() {
    List<Widget> widget = [];
    if (balanceQty != "") {
      widget.add(Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blueAccent),
          ),
          width: double.infinity,
          child: Row(children: [
            const Expanded(child: Text("ยอดคงเหลือ")),
            Text(balanceQty)
          ])));
    }
    for (int index = 0; index < product.unituses.length; index++) {
      String unitCode = product.unituses[index].unitcode;
      String unitName = findUnitName(unitCode);
      widget.add(Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blueAccent),
          ),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const Expanded(flex: 2, child: Text('จำนวน')),
            Expanded(
                flex: 5,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: 30,
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                padding: const EdgeInsets.all(0),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(0))),
                            onPressed: () {
                              setState(() {
                                if (orderByPackQty[index] > 0) {
                                  orderByPackQty[index]--;
                                }
                              });
                            },
                            child: const Icon(FontAwesomeIcons.minus),
                          )),
                      SizedBox(
                          width: 60,
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                padding: const EdgeInsets.all(0),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(0))),
                            onPressed: () {
                              setState(() {});
                            },
                            child: Text(orderByPackQty[index].toString()),
                          )),
                      SizedBox(
                          width: 30,
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                padding: const EdgeInsets.all(0),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(0))),
                            onPressed: () {
                              setState(() {
                                orderByPackQty[index]++;
                              });
                            },
                            child: const Icon(FontAwesomeIcons.plus),
                          ))
                    ])),
            Expanded(flex: 2, child: Text(unitName))
          ])));
    }
    if (product.unituses.length > 1) {
      widget.add(Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blueAccent),
          ),
          width: double.infinity,
          child: Row(children: const [
            Expanded(child: Text("ยอดสั่งรวมทั้งสิ้น")),
            Text("15 โหล x 8 ชิ้น")
          ])));
    }
    return Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: widget,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: Text(
                product.name1,
                style: const TextStyle(color: Colors.amber),
              ),
              actions: <Widget>[
                IconButton(
                  icon: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    // do something
                  },
                ),
                IconButton(
                  icon: const Icon(
                    FontAwesomeIcons.cartShopping,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    // do something
                  },
                ),
                IconButton(
                  icon: const Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    // do something
                  },
                )
              ],
            ),
            body: SingleChildScrollView(
                child: Column(
              children: [
                images(),
                if (product.options.isNotEmpty) options(),
                packings(),
                Html(data: product.description1)
              ],
            )),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Colors.white,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.message),
                  label: 'แชท',
                ),
                BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.cartPlus),
                  label: 'เพิ่มไปยังรถเข็น',
                ),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: Theme.of(context).primaryColor,
              unselectedItemColor: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
