import 'package:bloc_app/generated/json/base/json_field.dart';
import 'package:bloc_app/generated/json/product_list_entity.g.dart';
import 'dart:convert';

import 'package:hive/hive.dart';
export 'package:bloc_app/generated/json/product_list_entity.g.dart';

part 'product_list_entity.g.dart';

@JsonSerializable()
@HiveType(typeId: 0)
class ProductListEntity extends HiveObject {
  @HiveField(0)
  List<ProductListProducts> products = [];
  @HiveField(1)
  int? total = 0;
  @HiveField(2)
  int? skip = 0;
  @HiveField(3)
  int? limit = 0;

  ProductListEntity();

  factory ProductListEntity.fromJson(Map<String, dynamic> json) =>
      $ProductListEntityFromJson(json);

  Map<String, dynamic> toJson() => $ProductListEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
@HiveType(typeId: 1)
class ProductListProducts extends HiveObject {
  @HiveField(0)
  int? id = 0;
  @HiveField(1)
  String? title = '';
  @HiveField(2)
  String? description = '';
  @HiveField(3)
  int? price = 0;
  @HiveField(4)
  double? discountPercentage;
  @HiveField(5)
  double? rating;
  @HiveField(6)
  int? stock = 0;
  @HiveField(7)
  String? brand = '';
  @HiveField(8)
  String? category = '';
  @HiveField(9)
  String? thumbnail = '';
  @HiveField(10)
  List<String>? images = [];

  ProductListProducts();

  factory ProductListProducts.fromJson(Map<String, dynamic> json) =>
      $ProductListProductsFromJson(json);

  Map<String, dynamic> toJson() => $ProductListProductsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
