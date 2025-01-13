import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:vakinha_app/repository/products/products_repository.dart';
import '../../core/exceptions/repository_exception.dart';
import '../../core/rest_client/custom_dio.dart';
import '../../models/product_model.dart';


class ProductsRepositoryImpl implements ProductsRepository {
  final CustomDio _dio;

  ProductsRepositoryImpl(CustomDio dio) : _dio = dio;
  @override
  Future<List<ProductModel>> findAllProducts() async {
    try {
      final result = await _dio.unauth().get('/products');
      return result.data
          .map<ProductModel>(
            (p) => ProductModel.fromMap(p),
      )
          .toList();
    } on DioException catch (e, s) {
      log('Erro ao buscar produtos', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao buscar produtos');
    }
  }
}