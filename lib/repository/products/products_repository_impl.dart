
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:vakinha_app/core/rest_client/custom_dio.dart';
import 'package:vakinha_app/models/product_model.dart';
import 'package:vakinha_app/repository/products/product_repository.dart';

import '../../core/exceptions/repository_exception.dart';

class ProductsRepositoryImpl implements ProductRepository {
  final CustomDio dio;

  ProductsRepositoryImpl({required this.dio});

  @override
  Future<List<ProductModel>> findAllProducts() async {
    try {
      final result = await dio.unauth().get('/products');
      return result.data
          .map<ProductModel>(
            (p) => ProductModel.fromMap(p),
          )
          .toList;
    } on DioException catch (e, s) {
      log('Erro ao buscar Produtos', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao buscar Produtos');
    }
  }
}
