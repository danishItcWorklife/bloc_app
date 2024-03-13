import 'package:bloc_app/data/model/product_list_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class ProductStates extends Equatable {}

class ProductLoadingState extends ProductStates {
  @override
  List<Object?> get props => [];
}

class ProductLoadedStates extends ProductStates {
  late final ProductListEntity products;

  ProductLoadedStates(this.products);


  @override
  List<Object?> get props => [products];
}

class ProductErrorStates extends ProductStates {
  late final String error;

  ProductErrorStates(this.error);

  @override
  List<Object?> get props => [error];
}
