import 'package:equatable/equatable.dart';
import 'package:vakinha_app/dto/order_product_dto.dart';
import 'package:vakinha_app/models/product_model.dart';
import 'package:match/match.dart';

part 'home_state.g.dart';

@match
enum HomeStateStatus { initial, loading, loaded, error }

class HomeState extends Equatable {
  final HomeStateStatus status;
  final List<ProductModel> products;
  final String? errorMessage;
  final List<OrderProductDto> shoppingBag;

  const HomeState({
    required this.shoppingBag,
    required this.status,
    required this.products,
    this.errorMessage,
  });

  const HomeState.initial()
      : status = HomeStateStatus.initial,
        products = const [],
        shoppingBag = const [],
        errorMessage = null;

  @override
  @override
  List<Object?> get props => [status, products, errorMessage, shoppingBag];

  HomeState copyWith({
    HomeStateStatus? status,
    List<ProductModel>? products,
    List<OrderProductDto>? shoppingBag,
    String? errorMessage,
    // List<OrderProductDto>? shoppingBag,
  }) {
    return HomeState(
      status: status ?? this.status,
      products: products ?? this.products,
      errorMessage: errorMessage ?? this.errorMessage,
      shoppingBag: shoppingBag ?? this.shoppingBag,
    );
  }
}
