import 'package:bloc_app/generated/json/base/json_convert_content.dart';
import 'package:bloc_app/data/model/product_list_entity.dart';

ProductListEntity $ProductListEntityFromJson(Map<String, dynamic> json) {
  final ProductListEntity productListEntity = ProductListEntity();
  final List<ProductListProducts>? products = (json['products'] as List<
      dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<ProductListProducts>(e) as ProductListProducts)
      .toList();
  if (products != null) {
    productListEntity.products = products;
  }
  final int? total = jsonConvert.convert<int>(json['total']);
  if (total != null) {
    productListEntity.total = total;
  }
  final int? skip = jsonConvert.convert<int>(json['skip']);
  if (skip != null) {
    productListEntity.skip = skip;
  }
  final int? limit = jsonConvert.convert<int>(json['limit']);
  if (limit != null) {
    productListEntity.limit = limit;
  }
  return productListEntity;
}

Map<String, dynamic> $ProductListEntityToJson(ProductListEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['products'] = entity.products?.map((v) => v.toJson()).toList();
  data['total'] = entity.total;
  data['skip'] = entity.skip;
  data['limit'] = entity.limit;
  return data;
}

extension ProductListEntityExtension on ProductListEntity {
  ProductListEntity copyWith({
    List<ProductListProducts>? products,
    int? total,
    int? skip,
    int? limit,
  }) {
    return ProductListEntity()
      ..products = products ?? this.products
      ..total = total ?? this.total
      ..skip = skip ?? this.skip
      ..limit = limit ?? this.limit;
  }
}

ProductListProducts $ProductListProductsFromJson(Map<String, dynamic> json) {
  final ProductListProducts productListProducts = ProductListProducts();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    productListProducts.id = id;
  }
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    productListProducts.title = title;
  }
  final String? description = jsonConvert.convert<String>(json['description']);
  if (description != null) {
    productListProducts.description = description;
  }
  final int? price = jsonConvert.convert<int>(json['price']);
  if (price != null) {
    productListProducts.price = price;
  }
  final double? discountPercentage = jsonConvert.convert<double>(
      json['discountPercentage']);
  if (discountPercentage != null) {
    productListProducts.discountPercentage = discountPercentage;
  }
  final double? rating = jsonConvert.convert<double>(json['rating']);
  if (rating != null) {
    productListProducts.rating = rating;
  }
  final int? stock = jsonConvert.convert<int>(json['stock']);
  if (stock != null) {
    productListProducts.stock = stock;
  }
  final String? brand = jsonConvert.convert<String>(json['brand']);
  if (brand != null) {
    productListProducts.brand = brand;
  }
  final String? category = jsonConvert.convert<String>(json['category']);
  if (category != null) {
    productListProducts.category = category;
  }
  final String? thumbnail = jsonConvert.convert<String>(json['thumbnail']);
  if (thumbnail != null) {
    productListProducts.thumbnail = thumbnail;
  }
  final List<String>? images = (json['images'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (images != null) {
    productListProducts.images = images;
  }
  return productListProducts;
}

Map<String, dynamic> $ProductListProductsToJson(ProductListProducts entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['title'] = entity.title;
  data['description'] = entity.description;
  data['price'] = entity.price;
  data['discountPercentage'] = entity.discountPercentage;
  data['rating'] = entity.rating;
  data['stock'] = entity.stock;
  data['brand'] = entity.brand;
  data['category'] = entity.category;
  data['thumbnail'] = entity.thumbnail;
  data['images'] = entity.images;
  return data;
}

extension ProductListProductsExtension on ProductListProducts {
  ProductListProducts copyWith({
    int? id,
    String? title,
    String? description,
    int? price,
    double? discountPercentage,
    double? rating,
    int? stock,
    String? brand,
    String? category,
    String? thumbnail,
    List<String>? images,
  }) {
    return ProductListProducts()
      ..id = id ?? this.id
      ..title = title ?? this.title
      ..description = description ?? this.description
      ..price = price ?? this.price
      ..discountPercentage = discountPercentage ?? this.discountPercentage
      ..rating = rating ?? this.rating
      ..stock = stock ?? this.stock
      ..brand = brand ?? this.brand
      ..category = category ?? this.category
      ..thumbnail = thumbnail ?? this.thumbnail
      ..images = images ?? this.images;
  }
}