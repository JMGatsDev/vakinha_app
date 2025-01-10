import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:vakinha_app/pages/home/home_page.dart';
import 'package:vakinha_app/repository/products/product_repository.dart';
import 'package:vakinha_app/repository/products/products_repository_impl.dart';

class HomeRouter {
  HomeRouter._();

  static Widget get page => MultiProvider(
        providers: [
          Provider<ProductRepository>(
            create: (context) => ProductsRepositoryImpl(
              dio: context.read(),
            ),
          )
        ],
        child: const HomePage(),
      );
}
