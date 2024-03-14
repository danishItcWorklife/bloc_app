import 'package:bloc_app/data/model/product_list_entity.dart';
import 'package:bloc_app/domain/helper/MyConstants.dart';
import 'package:bloc_app/presentation/Homepage.dart';
import 'package:flutter/material.dart';
import 'package:bloc_app/data/ProductRepository.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //////////////Without Encryption////////////
  // await Hive.initFlutter();
  // Hive.registerAdapter(ProductListEntityAdapter());
  // Hive.registerAdapter(ProductListProductsAdapter());
  // final postsBox = await Hive.openBox<ProductListEntity>(MyConstants.boxProductsListKey);
  // await Hive.initFlutter();

  //////////////With Encryption////////////
  final encryptionKey = Hive.generateSecureKey();
  Hive.registerAdapter(ProductListEntityAdapter());
  Hive.registerAdapter(ProductListProductsAdapter());
  final postsBox = await Hive.openBox<ProductListEntity>(
      MyConstants.boxProductsListKey,
      encryptionCipher: HiveAesCipher(encryptionKey));
  ////////////////////////////////////
  runApp(HomePage(productRepository: ProductRepository(postsBox: postsBox)));
}
