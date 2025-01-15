import 'package:provider/provider.dart';
import 'package:vakinha_app/pages/product_datail/product_datail_page.dart';

class ProductDetailRouter {
  ProductDetailRouter._();

  static get page => MultiProvider(
        providers: [
          Provider(
            create: (context) => Object(),
          ),
        ],
        child: const ProductDatailPage(),
      );
}
