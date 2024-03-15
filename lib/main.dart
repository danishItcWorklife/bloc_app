import 'package:bloc_app/data/Local_Storage/secure_storage.dart';
import 'package:bloc_app/data/model/product_list_entity.dart';
import 'package:bloc_app/domain/helper/MyConstants.dart';
import 'package:bloc_app/presentation/Homepage.dart';
import 'package:flutter/material.dart';
import 'package:bloc_app/data/ProductRepository.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  // ensure that flutter engine is ready
  WidgetsFlutterBinding.ensureInitialized();
  //////////////Without Encryption////////////
  // await Hive.initFlutter();
  // Hive.registerAdapter(ProductListEntityAdapter());
  // Hive.registerAdapter(ProductListProductsAdapter());
  // final productsBox = await Hive.openBox<ProductListEntity>(AppConstants.boxProductsKey);

  //////////////With Encryption////////////
  // Initializes Hive with the path from [getApplicationDocumentsDirectory].
  await Hive.initFlutter();
  ///////
  SecureStorage secureStorage = SecureStorage();

  ///check key is already stored or not
  var encryptionKey =
      await secureStorage.readSecureData(AppConstants.boxProductsEncryptedKey);
  if (encryptionKey == null) {
    //Generate a secure key
    encryptionKey = Hive.generateSecureKey();
    print('encryptionKey:$encryptionKey');
    secureStorage.writeSecureData(
        AppConstants.boxProductsEncryptedKey, encryptionKey);
  } else {
    print('encryptionKey: SavedKey : $encryptionKey');
  }

  //Tells the hive to store data model hive objects
  Hive.registerAdapter(ProductListEntityAdapter());
  Hive.registerAdapter(ProductListProductsAdapter());

  //Encrypts the data
  final productsBox = await Hive.openBox<ProductListEntity>(
      AppConstants.boxProductsKey,
      encryptionCipher: HiveAesCipher(encryptionKey));
  //Passing the hive box object to be use in repo or data provider class
  runApp(
      HomePage(productRepository: ProductRepository(productsBox: productsBox)));
}
