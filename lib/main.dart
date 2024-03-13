import 'package:bloc_app/presentation/Homepage.dart';
import 'package:flutter/material.dart';
import 'package:bloc_app/data/ProductRepository.dart';

void main() {
  runApp(HomePage(productRepository: ProductRepository()));
}
