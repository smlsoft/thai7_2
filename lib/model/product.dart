import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class UnitModel {
  final String unitcode;
  final String unitname1;
  final String unitname2;
  final String unitname3;
  final String unitname4;
  final String unitname5;

  UnitModel({
    required this.unitcode,
    required this.unitname1,
    required this.unitname2,
    required this.unitname3,
    required this.unitname4,
    required this.unitname5,
  });

  factory UnitModel.fromJson(Map<String, dynamic> json) =>
      _$UnitModelFromJson(json);
  Map<String, dynamic> toJson() => _$UnitModelToJson(this);
}

@JsonSerializable()
class ProductModel {
  final String shopid;
  final String itemcode;
  final String name1;
  final String name2;
  final String name3;
  final String name4;
  final String name5;
  final List<ProductUnitModel> unituses;
  final String unitcode;
  final UnitModel unit;
  final String unitcost;
  final String unitstandard;
  final bool multiunit;
  final int itemtype;
  final int itemvat;
  final double normalprice;
  final double price;
  final double memberprice;
  final double pricerangemin;
  final double pricerangemax;
  final List<ProductImageModel> images;
  final bool recommended;
  final bool shoprecommended;
  final bool havepoint;
  final double starpersent;
  final int ordercount;
  final String description1;
  final String description2;
  final String description3;
  final String description4;
  final String description5;
  final List<ProductOptionModel> options;
  final List<AvailablePatternOptions> availablepatternoptions;
  final double orderminimum;

  ProductModel(
      {required this.shopid,
      required this.itemcode,
      required this.name1,
      required this.name2,
      required this.name3,
      required this.name4,
      required this.name5,
      required this.unitcode,
      required this.unit,
      required this.unitcost,
      required this.unitstandard,
      required this.multiunit,
      required this.itemtype,
      required this.itemvat,
      required this.price,
      required this.normalprice,
      required this.memberprice,
      required this.images,
      required this.recommended,
      required this.havepoint,
      required this.options,
      required this.availablepatternoptions,
      required this.unituses,
      required this.starpersent,
      required this.ordercount,
      required this.pricerangemin,
      required this.pricerangemax,
      required this.description1,
      required this.description2,
      required this.description3,
      required this.description4,
      required this.description5,
      required this.orderminimum,
      required this.shoprecommended});

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}

@JsonSerializable()
class ProductOptionModel {
  final String code;
  final int xorder;
  final bool required;
  final int choicetype;
  final int maxselect;
  final bool isstockcontrol;
  final String name1;
  final String name2;
  final String name3;
  final String name4;
  final String name5;

  final List<ProductOptionDetailModel> optiondetails;

  ProductOptionModel({
    required this.code,
    required this.xorder,
    required this.required,
    required this.choicetype,
    required this.maxselect,
    required this.isstockcontrol,
    required this.name1,
    required this.name2,
    required this.name3,
    required this.name4,
    required this.name5,
    required this.optiondetails,
  });

  factory ProductOptionModel.fromJson(Map<String, dynamic> json) =>
      _$ProductOptionModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductOptionModelToJson(this);
}

@JsonSerializable()
class ProductOptionDetailIncludeModel {
  final String optionguid;
  final String choicecode;
  final List<ProductOptionDetailIncludeModel>? choicedetails;

  ProductOptionDetailIncludeModel({
    required this.optionguid,
    required this.choicecode,
    required this.choicedetails,
  });

  factory ProductOptionDetailIncludeModel.fromJson(Map<String, dynamic> json) =>
      _$ProductOptionDetailIncludeModelFromJson(json);
  Map<String, dynamic> toJson() =>
      _$ProductOptionDetailIncludeModelToJson(this);
}

@JsonSerializable()
class ProductOptionDetailModel {
  final String optiondetailcode;
  final String name1;
  final String name2;
  final String name3;
  final String name4;
  final String name5;
  final String image;
  final List<ProductOptionDetailIncludeModel> choicedetails;
  @JsonKey(ignore: true)
  bool selected = false;
  @JsonKey(ignore: true)
  bool isenable = false;

  ProductOptionDetailModel({
    required this.optiondetailcode,
    required this.name1,
    required this.name2,
    required this.name3,
    required this.name4,
    required this.name5,
    required this.image,
    required this.choicedetails,
  });

  factory ProductOptionDetailModel.fromJson(Map<String, dynamic> json) =>
      _$ProductOptionDetailModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductOptionDetailModelToJson(this);
}

@JsonSerializable()
class AvailablePatternOptions {
  final String patternkey;
  final int qty;
  final double price;
  final List<String> optionpatterntags;

  AvailablePatternOptions({
    required this.patternkey,
    required this.qty,
    required this.price,
    required this.optionpatterntags,
  });

  factory AvailablePatternOptions.fromJson(Map<String, dynamic> json) =>
      _$AvailablePatternOptionsFromJson(json);
  Map<String, dynamic> toJson() => _$AvailablePatternOptionsToJson(this);
}

@JsonSerializable()
class ProductUnitModel {
  final String unitcode;
  final double itemunitstd;
  final double itemunitdiv;
  final bool isunitcost;

  ProductUnitModel({
    required this.unitcode,
    required this.itemunitstd,
    required this.itemunitdiv,
    required this.isunitcost,
  });

  factory ProductUnitModel.fromJson(Map<String, dynamic> json) =>
      _$ProductUnitModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductUnitModelToJson(this);
}

@JsonSerializable()
class ProductImageModel {
  final String uri;

  ProductImageModel({
    required this.uri,
  });

  factory ProductImageModel.fromJson(Map<String, dynamic> json) =>
      _$ProductImageModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductImageModelToJson(this);
}

@JsonSerializable()
class ProductBalanceModel {
  final String itemcode;
  final double qty;
  final List<ProductBalanceUnitModel> units;
  final List<ProductBalanceOptionModel> options;

  ProductBalanceModel({
    required this.itemcode,
    required this.qty,
    required this.units,
    required this.options,
  });

  factory ProductBalanceModel.fromJson(Map<String, dynamic> json) =>
      _$ProductBalanceModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductBalanceModelToJson(this);
}

@JsonSerializable()
class ProductBalanceUnitModel {
  final String unitcode;
  final double qty;

  ProductBalanceUnitModel({
    required this.unitcode,
    required this.qty,
  });

  factory ProductBalanceUnitModel.fromJson(Map<String, dynamic> json) =>
      _$ProductBalanceUnitModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductBalanceUnitModelToJson(this);
}

@JsonSerializable()
class ProductBalanceOptionModel {
  final String optionguid;
  final List<ProductBalanceOptionDetailModel> details;

  ProductBalanceOptionModel({
    required this.optionguid,
    required this.details,
  });

  factory ProductBalanceOptionModel.fromJson(Map<String, dynamic> json) =>
      _$ProductBalanceOptionModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductBalanceOptionModelToJson(this);
}

@JsonSerializable()
class ProductBalanceOptionDetailModel {
  final String optionguid;
  final double qty;

  ProductBalanceOptionDetailModel({
    required this.optionguid,
    required this.qty,
  });

  factory ProductBalanceOptionDetailModel.fromJson(Map<String, dynamic> json) =>
      _$ProductBalanceOptionDetailModelFromJson(json);
  Map<String, dynamic> toJson() =>
      _$ProductBalanceOptionDetailModelToJson(this);
}
