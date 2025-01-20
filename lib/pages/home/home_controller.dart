import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:vakinha_app/dto/order_product_dto.dart';
import 'package:vakinha_app/pages/home/home_state.dart';

import '../../repository/products/products_repository.dart';

class HomeController extends Cubit<HomeState> {
  final ProductsRepository _productRepository;

  HomeController(this._productRepository) : super(const HomeState.initial());

  Future<void> loadProducts() async {
    emit(state.copyWith(status: HomeStateStatus.loading));
    try {
      final products = await _productRepository.findAllProducts();
      emit(state.copyWith(status: HomeStateStatus.loaded, products: products));
    } on Exception catch (e, s) {
      log('Erro ao buscar produtos', error: e, stackTrace: s);
      emit(state.copyWith(
          status: HomeStateStatus.error,
          errorMessage: 'Erro ao buscar Produtos'));
    }
  }

  void addOrRemoveUpdateBag(OrderProductDto orderProduct) {
    final shoppingBag = [...state.shoppingBag];

    final orderIndex = shoppingBag.indexWhere(
        (orderP) => orderP.productModel == orderProduct.productModel);

    if (orderIndex > -1) {
      if (orderProduct.amount == 0) {
        shoppingBag.removeAt(orderIndex);
      } else {
        shoppingBag[orderIndex] = orderProduct;
      }
    } else {
      shoppingBag.add(orderProduct);
    }
    emit(
      state.copyWith(shoppingBag: shoppingBag),
    );
  }
}
