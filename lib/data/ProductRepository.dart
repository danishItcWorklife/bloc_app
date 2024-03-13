import 'dart:async';

import 'package:bloc_app/data/DataProvider.dart';
import 'package:bloc_app/data/model/product_list_entity.dart';

class ProductRepository {
  final DataProvider _dataProvider;

  ProductRepository({DataProvider? dataProvider})
      : _dataProvider = dataProvider ?? DataProvider();

  Future<ProductListEntity> getProductList() async {
    final products = await _dataProvider.fetchProducts();
    return products;
  }

  Stream<ProductListEntity> getProductListStream() {
    final products = _dataProvider.fetchProductsStream();
     return products;
  }

}
