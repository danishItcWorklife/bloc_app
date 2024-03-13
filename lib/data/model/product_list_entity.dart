import 'package:bloc_app/generated/json/base/json_field.dart';
import 'package:bloc_app/generated/json/product_list_entity.g.dart';
import 'dart:convert';
export 'package:bloc_app/generated/json/product_list_entity.g.dart';

@JsonSerializable()
class ProductListEntity {
	List<ProductListProducts> products = [];
	int? total = 0;
	int? skip = 0;
	int? limit = 0;

	ProductListEntity();

	factory ProductListEntity.fromJson(Map<String, dynamic> json) => $ProductListEntityFromJson(json);

	Map<String, dynamic> toJson() => $ProductListEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class ProductListProducts {
	int? id = 0;
	String? title = '';
	String? description = '';
	int? price = 0;
	double? discountPercentage;
	double? rating;
	int? stock = 0;
	String? brand = '';
	String? category = '';
	String? thumbnail = '';
	List<String>? images = [];

	ProductListProducts();

	factory ProductListProducts.fromJson(Map<String, dynamic> json) => $ProductListProductsFromJson(json);

	Map<String, dynamic> toJson() => $ProductListProductsToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}