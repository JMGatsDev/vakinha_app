import 'package:flutter/material.dart';
import 'package:vakinha_app/pages/home/widgets/delivery_product_tile.dart';

import '../../core/ui/widgets/delivery_appbar.dart';
import '../../models/product_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppBar(),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return DeliveryProductTile(
                      productModel: ProductModel(
                        id: index,
                        name: 'produto',
                        description: 'descrição',
                        price: 250.5,
                        image: 'https://gourmetjr.com.br/wp-content/uploads/2018/03/JPEG-image-B6230B799E47-1_1170x600_acf_cropped_490x292_acf_cropped.jpeg',
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
