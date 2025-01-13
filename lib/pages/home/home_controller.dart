import 'package:bloc/bloc.dart';
import 'package:vakinha_app/pages/home/widgets/home_state.dart';

import '../../repository/products/products_repository.dart';

class HomeController extends Cubit<HomeState> {
  final ProductsRepository _productRepository;

  HomeController(this._productRepository) : super(const HomeState.initial());

  Future<void> loadProducts() async {
    emit(state.copyWith(status: HomeStateStatus.loading));
    try {
      final products = await _productRepository.findAllProducts();
      emit(state.copyWith(status: HomeStateStatus.loaded, products: products));  // Aqui você passa a lista de produtos
    } on Exception catch (e) {
      emit(state.copyWith(status: HomeStateStatus.error));  // Emitir erro caso ocorra uma falha
    }
  }

}
