import 'dart:async';

import 'package:bloc_app/data/DataProvider.dart';
import 'package:bloc_app/data/model/product_list_entity.dart';
import 'package:bloc_app/domain/helper/MyConstants.dart';
import 'package:hive/hive.dart';

class ProductRepository {
  final DataProvider _dataProvider;
  final Box<ProductListEntity?> postsBox;

  ProductRepository({DataProvider? dataProvider, required this.postsBox})
      : _dataProvider = dataProvider ?? DataProvider(postsBox: postsBox);

  Future<ProductListEntity> getProductList() async {
    final products = await _dataProvider.fetchProducts();
    return products;
  }

  Stream<ProductListEntity> getProductListStream() {
    final products = _dataProvider.fetchProductsStream();
    return products;
  }

  Future<void> savePostsLocally({
    required ProductListEntity posts,
  }) async {
    _dataProvider.savePostsLocally(posts: posts);
  }

  Future<ProductListEntity?> fetchAllLocalPosts() async {
    final products = _dataProvider.fetchAllLocalPosts();
    return products;
  }
}
