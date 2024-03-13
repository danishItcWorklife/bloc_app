import 'dart:convert';
import 'dart:io';

import 'package:bloc_app/data/model/product_list_entity.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';

class DataProvider {
  Future<SecurityContext> get globalContext async {
    final sslCert = await rootBundle.load('assets/dummyjson.cer');
    SecurityContext securityContext = SecurityContext(withTrustedRoots: false);
    securityContext.setTrustedCertificatesBytes(sslCert.buffer.asInt8List());
    return securityContext;
  }

  Future<http.Client> getSSLPinningClient() async {
    HttpClient client = HttpClient(context: await globalContext);
    client.badCertificateCallback =
        (X509Certificate cert, String host, int port) => false;
    IOClient ioClient = IOClient(client);
    return ioClient;
  }
  String baseURL = 'https://dummyjson.com/products';

  Future<ProductListEntity> fetchProducts() async {
    final client = await getSSLPinningClient();
    final http.Client httpClient =client;
    final response = await httpClient.get(Uri.parse(baseURL));
    if (response.statusCode == 200) {
      return ProductListEntity.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Failed to receive data');
    }
  }

  Stream<ProductListEntity> fetchProductsStream() async* {
    final response = await http.get(Uri.parse(baseURL));
    if (response.statusCode == 200) {
      yield ProductListEntity.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Failed to receive data');
    }
  }


}