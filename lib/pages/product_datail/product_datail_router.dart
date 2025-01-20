import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:vakinha_app/pages/product_datail/product_datail_page.dart';
import 'package:vakinha_app/pages/product_datail/product_detail_controller.dart';

class ProductDetailRouter {
  ProductDetailRouter._();

  static get page => MultiProvider(
        providers: [
          Provider(
            create: (context) => ProductDetailController(),
          ),
        ],
        builder: (context, child) {
          final args = ModalRoute.of(context)!.settings.arguments
              as Map<String, dynamic>;
          return ProductDatailPage(
            productModel: args['product'],
            orderProductDto: args['order'],
          );
        },
      );
}
