import 'dart:convert';
import 'dart:developer';

import 'package:thai7/model/product.dart';
import 'package:thai7/global.dart' as global;

ProductModel dataProduct() {
  return ProductModel(
    shopid: "shopid",
    itemcode: "A001",
    name1:
        "เสื้อยิดคอกลม ADIDAS รุ่นหล่อแน่นอน เสื้อยิดคอกลม sasdad ADIDAS รุ่นหล่อแน่นอน เสื้อยิดคอกลม ADIDAS รุ่นหล่อแน่นอน เสื้อยิดคอกลม ADIDAS รุ่นหล่อแน่นอน",
    name2: "",
    name3: "",
    name4: "",
    name5: "",
    unitcost: "U01",
    unitstandard: "U01",
    multiunit: true,
    itemtype: 1,
    itemvat: 1,
    normalprice: 150,
    pricerangemin: 20,
    pricerangemax: 50,
    price: 111,
    memberprice: 110,
    orderminimum: 1,
    shoprecommended: true,
    description1: """<html>adlhjkalkadklaklsd adjkladl<br/>
      <img src="https://res.cloudinary.com/cenergy-innovation-limited-head-office/image/fetch/c_scale,q_70,f_auto,h_740/https://d1dtruvuor2iuy.cloudfront.net/media/catalog/product/0/0/000277092_qa43q65bakxxt.jpg" alt="Italian Trulli">
      <br/>สวัสดีประเทศไทย</html>""",
    description2: "",
    description3: "",
    description4: "",
    description5: "",
    images: [
      ProductImageModel(
          uri: "https://ideakidshop.com/sites/idea_kid/upload/34491_img1.jpg"),
      ProductImageModel(
          uri:
              "https://hm-media-prod.s3.amazonaws.com/pub/media/catalog/product/medium/76cb6fbf1ffb467649e3cdf6b1f6f06a4c4b6dd7_xxl-1.jpg")
    ],
    starpersent: 70,
    ordercount: 232322,
    recommended: true,
    havepoint: true,
    options: [
      ProductOptionModel(
          code: "X0001",
          xorder: 1,
          required: true,
          choicetype: 0,
          maxselect: 1,
          isstockcontrol: true,
          name1: "สี",
          name2: "Color",
          name3: "",
          name4: "",
          name5: "",
          isstock: true,
          optiondetails: [
            ProductOptionDetailModel(
                optiondetailcode: "G12",
                name1: "ขาว",
                image: "",
                name2: "",
                name3: "",
                name4: "",
                name5: "",
                choicedetails: [
                  ProductOptionDetailIncludeModel(
                      optionguid: "X2",
                      choicecode: "X02",
                      choicedetails: [
                        ProductOptionDetailIncludeModel(
                            optionguid: "S11",
                            choicecode: "S11",
                            choicedetails: [
                              ProductOptionDetailIncludeModel(
                                  optionguid: "S111",
                                  choicecode: "S111",
                                  choicedetails: null)
                            ]),
                        ProductOptionDetailIncludeModel(
                            optionguid: "S12",
                            choicecode: "S12",
                            choicedetails: [
                              ProductOptionDetailIncludeModel(
                                  optionguid: "S112",
                                  choicecode: "S112",
                                  choicedetails: null)
                            ])
                      ])
                ]),
            ProductOptionDetailModel(
                optiondetailcode: "G13",
                image:
                    "https://image.makewebeasy.net/makeweb/0/lfZl8QEXr/Staionery1000px/ศรัทธา_MockResize.jpg?v=202012190947",
                name1: "ดำ",
                name2: "",
                name3: "",
                name4: "",
                name5: "",
                choicedetails: [
                  ProductOptionDetailIncludeModel(
                      optionguid: "X2",
                      choicecode: "X02",
                      choicedetails: [
                        ProductOptionDetailIncludeModel(
                            optionguid: "S11",
                            choicecode: "S11",
                            choicedetails: [
                              ProductOptionDetailIncludeModel(
                                  optionguid: "S111",
                                  choicecode: "S111",
                                  choicedetails: null),
                              ProductOptionDetailIncludeModel(
                                  optionguid: "S112",
                                  choicecode: "S112",
                                  choicedetails: null),
                            ]),
                        ProductOptionDetailIncludeModel(
                            optionguid: "S12",
                            choicecode: "S12",
                            choicedetails: [
                              ProductOptionDetailIncludeModel(
                                  optionguid: "S112",
                                  choicecode: "S112",
                                  choicedetails: [
                                    ProductOptionDetailIncludeModel(
                                        optionguid: "W112",
                                        choicecode: "W112",
                                        choicedetails: [
                                          ProductOptionDetailIncludeModel(
                                              optionguid: "Q111",
                                              choicecode: "Q111",
                                              choicedetails: null),
                                          ProductOptionDetailIncludeModel(
                                              optionguid: "Q112",
                                              choicecode: "Q112",
                                              choicedetails: null)
                                        ])
                                  ])
                            ])
                      ])
                ]),
            ProductOptionDetailModel(
                optiondetailcode: "G14",
                image: "",
                name1: "แดง",
                name2: "",
                name3: "",
                name4: "",
                name5: "",
                choicedetails: [])
          ]),
      ProductOptionModel(
          code: "X2",
          xorder: 1,
          required: true,
          choicetype: 0,
          maxselect: 1,
          isstockcontrol: true,
          name1: "ขนาด",
          name2: "Size",
          name3: "",
          name4: "",
          name5: "",
          isstock: true,
          optiondetails: [
            ProductOptionDetailModel(
                optiondetailcode: "S11",
                image:
                    "https://cdn.pixabay.com/photo/2013/07/12/15/34/shirt-150087_960_720.png",
                name1: "S",
                name2: "",
                name3: "",
                name4: "",
                name5: "",
                choicedetails: []),
            ProductOptionDetailModel(
                optiondetailcode: "S12",
                image: "",
                name1: "M",
                name2: "",
                name3: "",
                name4: "",
                name5: "",
                choicedetails: []),
            ProductOptionDetailModel(
                optiondetailcode: "S13",
                image: "",
                name1: "XL",
                name2: "",
                name3: "",
                name4: "",
                name5: "",
                choicedetails: []),
            ProductOptionDetailModel(
                optiondetailcode: "S14",
                image: "",
                name1: "XXL",
                name2: "",
                name3: "",
                name4: "",
                name5: "",
                choicedetails: [])
          ]),
      ProductOptionModel(
          code: "X2",
          xorder: 1,
          required: true,
          choicetype: 0,
          maxselect: 1,
          isstockcontrol: true,
          name1: "การออกแบบ",
          name2: "Design",
          name3: "",
          name4: "",
          name5: "",
          isstock: true,
          optiondetails: [
            ProductOptionDetailModel(
                optiondetailcode: "S111",
                image: "",
                name1: "คอกลม",
                name2: "",
                name3: "",
                name4: "",
                name5: "",
                choicedetails: []),
            ProductOptionDetailModel(
                optiondetailcode: "S112",
                image: "",
                name1: "คอส V",
                name2: "",
                name3: "",
                name4: "",
                name5: "",
                choicedetails: []),
          ]),
      ProductOptionModel(
          code: "X4",
          xorder: 1,
          required: true,
          choicetype: 0,
          maxselect: 1,
          isstockcontrol: true,
          name1: "ลายปักเพิ่ม แถม",
          name2: "Extra",
          name3: "",
          name4: "",
          name5: "",
          isstock: false,
          optiondetails: [
            ProductOptionDetailModel(
                optiondetailcode: "W111",
                image: "",
                name1: "ปักด้านซ้าย",
                name2: "",
                name3: "",
                name4: "",
                name5: "",
                choicedetails: []),
            ProductOptionDetailModel(
                optiondetailcode: "W112",
                image: "",
                name1: "ปักตรงกลาง",
                name2: "",
                name3: "",
                name4: "",
                name5: "",
                choicedetails: []),
            ProductOptionDetailModel(
                optiondetailcode: "W113",
                image: "",
                name1: "ปักด้านขวา",
                name2: "",
                name3: "",
                name4: "",
                name5: "",
                choicedetails: []),
          ]),
      ProductOptionModel(
          code: "X4",
          xorder: 1,
          required: true,
          choicetype: 0,
          maxselect: 1,
          isstockcontrol: true,
          name1: "กระเป๋า คิดเงินเพิ่ม",
          name2: "Extra",
          name3: "",
          name4: "",
          name5: "",
          isstock: false,
          optiondetails: [
            ProductOptionDetailModel(
                optiondetailcode: "Q111",
                image: "",
                name1: "ด้านซ้าย",
                name2: "",
                name3: "",
                name4: "",
                name5: "",
                choicedetails: []),
            ProductOptionDetailModel(
                optiondetailcode: "Q112",
                image: "",
                name1: "ด้านขวา",
                name2: "",
                name3: "",
                name4: "",
                name5: "",
                choicedetails: []),
          ])
    ],
    unitcode: "U01",
    unit: UnitModel(
        unitcode: "U01",
        unitname1: "ตัว",
        unitname2: "",
        unitname3: "",
        unitname4: "",
        unitname5: ""),
    unituses: [
      ProductUnitModel(
          unitcode: "U01",
          itemunitstd: 1.0,
          itemunitdiv: 1.0,
          isunitcost: true),
      ProductUnitModel(
          unitcode: "U02",
          itemunitstd: 12.0,
          itemunitdiv: 1.0,
          isunitcost: false)
    ],
  );
}

void dataDemo({bool addUnit = true}) {
  if (addUnit) {
    global.units.add(UnitModel(
        unitcode: "U01",
        unitname1: "ตัว",
        unitname2: "",
        unitname3: "",
        unitname4: "",
        unitname5: ""));
    global.units.add(UnitModel(
        unitcode: "U02",
        unitname1: "โหล",
        unitname2: "",
        unitname3: "",
        unitname4: "",
        unitname5: ""));
  }
  global.products.add(dataProduct());
  String myjson = json.encode(global.products[0].toJson());
  log("JSON : $myjson");
}
