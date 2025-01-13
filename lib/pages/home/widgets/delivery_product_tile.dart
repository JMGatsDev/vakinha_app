import 'package:flutter/material.dart';
import 'package:vakinha_app/core/extensions/formatter_extension.dart';
import 'package:vakinha_app/core/ui/styles/constants.dart';
import 'package:vakinha_app/models/product_model.dart';

class DeliveryProductTile extends StatelessWidget {
  const DeliveryProductTile({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  productModel.name,
                  style: MyTextStyles.textExtraBold.copyWith(
                    fontSize: 18,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  productModel.description,
                  style: MyTextStyles.textRegular.copyWith(
                    fontSize: 14,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  productModel.price.currentcyPTBR,
                  style: MyTextStyles.textMedium
                      .copyWith(fontSize: 12, color: ColorsApp.secondary),
                ),
              ),
            ],
          ),
          FadeInImage.assetNetwork(
            placeholder: 'assets/images/loading.gif',
            image: productModel.image,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
