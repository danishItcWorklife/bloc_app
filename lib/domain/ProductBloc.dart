import 'dart:async';

import 'package:bloc_app/data/ProductRepository.dart';
import 'package:bloc_app/data/model/product_list_entity.dart';
import 'package:bloc_app/domain/ProductEvent.dart';
import 'package:bloc_app/domain/ProductStates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBLoc extends Bloc<ProductEvent, ProductStates> {
  late final ProductRepository _productRepository;

  ProductBLoc(this._productRepository) : super(ProductLoadingState()) {
    // on<LoadProductEvent>((event, emit) async {
    //   emit(ProductLoadingState());
    //   try {
    //     final products = await _productRepository.getProductList();
    //     // print(products);
    //     emit(ProductLoadedStates(products));
    //   } catch (e) {
    //     print(e.toString());
    //     emit(ProductErrorStates(e.toString()));
    //   }
    // });

    on<LoadProductEvent>((event, emit) async {
      emit(ProductLoadingState());
      try {
        await for (var products in _productRepository.getProductListStream()) {
          emit(ProductLoadedStates(products));
        }
      } catch (e) {
        emit(ProductErrorStates(e.toString()));
      }
    });
  }
}
