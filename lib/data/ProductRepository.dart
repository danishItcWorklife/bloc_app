import 'dart:async';

import 'package:bloc_app/data/DataProvider.dart';
import 'package:bloc_app/data/model/product_list_entity.dart';
import 'package:bloc_app/domain/helper/MyConstants.dart';
import 'package:hive/hive.dart';

class ProductRepository {
  final DataProvider _dataProvider;
  final Box<ProductListEntity?> productsBox;

  ProductRepository({DataProvider? dataProvider, required this.productsBox})
      : _dataProvider = dataProvider ?? DataProvider(productsBox: productsBox);

  Future<ProductListEntity> getProductList() async {
    final products = await _dataProvider.fetchProducts();
    return products;
  }

  // Stream<ProductListEntity> getProductListStream() {
  //   final products = _dataProvider.fetchProductsStream();
  //   return products;
  // }

  Future<void> saveProductsLocally({
    required ProductListEntity products,
  }) async {
    _dataProvider.saveProductsLocally(products: products);
  }

  Future<ProductListEntity?> fetchAllLocalProducts() async {
    final products = _dataProvider.fetchAllLocalProducts();
    return products;
  }
}
