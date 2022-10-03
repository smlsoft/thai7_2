// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UnitModel _$UnitModelFromJson(Map<String, dynamic> json) => UnitModel(
      unitcode: json['unitcode'] as String,
      unitname1: json['unitname1'] as String,
      unitname2: json['unitname2'] as String,
      unitname3: json['unitname3'] as String,
      unitname4: json['unitname4'] as String,
      unitname5: json['unitname5'] as String,
    );

Map<String, dynamic> _$UnitModelToJson(UnitModel instance) => <String, dynamic>{
      'unitcode': instance.unitcode,
      'unitname1': instance.unitname1,
      'unitname2': instance.unitname2,
      'unitname3': instance.unitname3,
      'unitname4': instance.unitname4,
      'unitname5': instance.unitname5,
    };

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      shopid: json['shopid'] as String,
      itemcode: json['itemcode'] as String,
      name1: json['name1'] as String,
      name2: json['name2'] as String,
      name3: json['name3'] as String,
      name4: json['name4'] as String,
      name5: json['name5'] as String,
      unitcode: json['unitcode'] as String,
      unit: UnitModel.fromJson(json['unit'] as Map<String, dynamic>),
      unitcost: json['unitcost'] as String,
      unitstandard: json['unitstandard'] as String,
      multiunit: json['multiunit'] as bool,
      itemtype: json['itemtype'] as int,
      itemvat: json['itemvat'] as int,
      price: (json['price'] as num).toDouble(),
      normalprice: (json['normalprice'] as num).toDouble(),
      memberprice: (json['memberprice'] as num).toDouble(),
      images: (json['images'] as List<dynamic>)
          .map((e) => ProductImageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      recommended: json['recommended'] as bool,
      havepoint: json['havepoint'] as bool,
      options: (json['options'] as List<dynamic>)
          .map((e) => ProductOptionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      unituses: (json['unituses'] as List<dynamic>)
          .map((e) => ProductUnitModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      starpersent: (json['starpersent'] as num).toDouble(),
      ordercount: json['ordercount'] as int,
      pricerangemin: (json['pricerangemin'] as num).toDouble(),
      pricerangemax: (json['pricerangemax'] as num).toDouble(),
      description1: json['description1'] as String,
      description2: json['description2'] as String,
      description3: json['description3'] as String,
      description4: json['description4'] as String,
      description5: json['description5'] as String,
      orderminimum: (json['orderminimum'] as num).toDouble(),
      shoprecommended: json['shoprecommended'] as bool,
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'shopid': instance.shopid,
      'itemcode': instance.itemcode,
      'name1': instance.name1,
      'name2': instance.name2,
      'name3': instance.name3,
      'name4': instance.name4,
      'name5': instance.name5,
      'unituses': instance.unituses,
      'unitcode': instance.unitcode,
      'unit': instance.unit,
      'unitcost': instance.unitcost,
      'unitstandard': instance.unitstandard,
      'multiunit': instance.multiunit,
      'itemtype': instance.itemtype,
      'itemvat': instance.itemvat,
      'normalprice': instance.normalprice,
      'price': instance.price,
      'memberprice': instance.memberprice,
      'pricerangemin': instance.pricerangemin,
      'pricerangemax': instance.pricerangemax,
      'images': instance.images,
      'recommended': instance.recommended,
      'shoprecommended': instance.shoprecommended,
      'havepoint': instance.havepoint,
      'starpersent': instance.starpersent,
      'ordercount': instance.ordercount,
      'description1': instance.description1,
      'description2': instance.description2,
      'description3': instance.description3,
      'description4': instance.description4,
      'description5': instance.description5,
      'options': instance.options,
      'orderminimum': instance.orderminimum,
    };

ProductOptionModel _$ProductOptionModelFromJson(Map<String, dynamic> json) =>
    ProductOptionModel(
      code: json['code'] as String,
      xorder: json['xorder'] as int,
      required: json['required'] as bool,
      choicetype: json['choicetype'] as int,
      maxselect: json['maxselect'] as int,
      isstockcontrol: json['isstockcontrol'] as bool,
      name1: json['name1'] as String,
      name2: json['name2'] as String,
      name3: json['name3'] as String,
      name4: json['name4'] as String,
      name5: json['name5'] as String,
      isstock: json['isstock'] as bool,
      optiondetails: (json['optiondetails'] as List<dynamic>)
          .map((e) =>
              ProductOptionDetailModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductOptionModelToJson(ProductOptionModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'xorder': instance.xorder,
      'required': instance.required,
      'choicetype': instance.choicetype,
      'maxselect': instance.maxselect,
      'isstockcontrol': instance.isstockcontrol,
      'name1': instance.name1,
      'name2': instance.name2,
      'name3': instance.name3,
      'name4': instance.name4,
      'name5': instance.name5,
      'isstock': instance.isstock,
      'optiondetails': instance.optiondetails,
    };

ProductOptionDetailIncludeModel _$ProductOptionDetailIncludeModelFromJson(
        Map<String, dynamic> json) =>
    ProductOptionDetailIncludeModel(
      optionguid: json['optionguid'] as String,
      choicecode: json['choicecode'] as String,
      choicedetails: (json['choicedetails'] as List<dynamic>?)
          ?.map((e) => ProductOptionDetailIncludeModel.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductOptionDetailIncludeModelToJson(
        ProductOptionDetailIncludeModel instance) =>
    <String, dynamic>{
      'optionguid': instance.optionguid,
      'choicecode': instance.choicecode,
      'choicedetails': instance.choicedetails,
    };

ProductOptionDetailModel _$ProductOptionDetailModelFromJson(
        Map<String, dynamic> json) =>
    ProductOptionDetailModel(
      optiondetailcode: json['optiondetailcode'] as String,
      name1: json['name1'] as String,
      name2: json['name2'] as String,
      name3: json['name3'] as String,
      name4: json['name4'] as String,
      name5: json['name5'] as String,
      image: json['image'] as String,
      choicedetails: (json['choicedetails'] as List<dynamic>)
          .map((e) => ProductOptionDetailIncludeModel.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductOptionDetailModelToJson(
        ProductOptionDetailModel instance) =>
    <String, dynamic>{
      'optiondetailcode': instance.optiondetailcode,
      'name1': instance.name1,
      'name2': instance.name2,
      'name3': instance.name3,
      'name4': instance.name4,
      'name5': instance.name5,
      'image': instance.image,
      'choicedetails': instance.choicedetails,
    };

ProductUnitModel _$ProductUnitModelFromJson(Map<String, dynamic> json) =>
    ProductUnitModel(
      unitcode: json['unitcode'] as String,
      itemunitstd: (json['itemunitstd'] as num).toDouble(),
      itemunitdiv: (json['itemunitdiv'] as num).toDouble(),
      isunitcost: json['isunitcost'] as bool,
    );

Map<String, dynamic> _$ProductUnitModelToJson(ProductUnitModel instance) =>
    <String, dynamic>{
      'unitcode': instance.unitcode,
      'itemunitstd': instance.itemunitstd,
      'itemunitdiv': instance.itemunitdiv,
      'isunitcost': instance.isunitcost,
    };

ProductImageModel _$ProductImageModelFromJson(Map<String, dynamic> json) =>
    ProductImageModel(
      uri: json['uri'] as String,
    );

Map<String, dynamic> _$ProductImageModelToJson(ProductImageModel instance) =>
    <String, dynamic>{
      'uri': instance.uri,
    };

ProductBalanceModel _$ProductBalanceModelFromJson(Map<String, dynamic> json) =>
    ProductBalanceModel(
      itemcode: json['itemcode'] as String,
      qty: (json['qty'] as num).toDouble(),
      units: (json['units'] as List<dynamic>)
          .map((e) =>
              ProductBalanceUnitModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      options: (json['options'] as List<dynamic>)
          .map((e) =>
              ProductBalanceOptionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductBalanceModelToJson(
        ProductBalanceModel instance) =>
    <String, dynamic>{
      'itemcode': instance.itemcode,
      'qty': instance.qty,
      'units': instance.units,
      'options': instance.options,
    };

ProductBalanceUnitModel _$ProductBalanceUnitModelFromJson(
        Map<String, dynamic> json) =>
    ProductBalanceUnitModel(
      unitcode: json['unitcode'] as String,
      qty: (json['qty'] as num).toDouble(),
    );

Map<String, dynamic> _$ProductBalanceUnitModelToJson(
        ProductBalanceUnitModel instance) =>
    <String, dynamic>{
      'unitcode': instance.unitcode,
      'qty': instance.qty,
    };

ProductBalanceOptionModel _$ProductBalanceOptionModelFromJson(
        Map<String, dynamic> json) =>
    ProductBalanceOptionModel(
      optionguid: json['optionguid'] as String,
      details: (json['details'] as List<dynamic>)
          .map((e) => ProductBalanceOptionDetailModel.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductBalanceOptionModelToJson(
        ProductBalanceOptionModel instance) =>
    <String, dynamic>{
      'optionguid': instance.optionguid,
      'details': instance.details,
    };

ProductBalanceOptionDetailModel _$ProductBalanceOptionDetailModelFromJson(
        Map<String, dynamic> json) =>
    ProductBalanceOptionDetailModel(
      optionguid: json['optionguid'] as String,
      qty: (json['qty'] as num).toDouble(),
    );

Map<String, dynamic> _$ProductBalanceOptionDetailModelToJson(
        ProductBalanceOptionDetailModel instance) =>
    <String, dynamic>{
      'optionguid': instance.optionguid,
      'qty': instance.qty,
    };
