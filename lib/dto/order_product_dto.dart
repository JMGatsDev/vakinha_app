import 'package:vakinha_app/models/product_model.dart';

class OrderProductDto {
  final ProductModel productModel;
  final int amout;

  OrderProductDto({
    required this.productModel,
    required this.amout,
  });

  double get totalPrice => amout * productModel.price;
}
