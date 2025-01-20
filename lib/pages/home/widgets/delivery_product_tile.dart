import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vakinha_app/core/extensions/formatter_extension.dart';
import 'package:vakinha_app/core/ui/styles/constants.dart';
import 'package:vakinha_app/dto/order_product_dto.dart';
import 'package:vakinha_app/models/product_model.dart';
import 'package:vakinha_app/pages/home/home_controller.dart';

class DeliveryProductTile extends StatelessWidget {
  const DeliveryProductTile(
      {super.key, required this.productModel, this.orderProductDto});

  final ProductModel productModel;
  final OrderProductDto? orderProductDto;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final controller = context.read<HomeController>();
        final orderProduct = await Navigator.of(context).pushNamed(
          '/home/productDetail',
          arguments: {
            'product': productModel,
            'order': orderProductDto,
          },
         );
        if (orderProduct != null) {
          controller.addOrRemoveUpdateBag(orderProduct as OrderProductDto);
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
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
                      softWrap: true,
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
            ),
            FadeInImage.assetNetwork(
              placeholder: 'assets/images/loading.gif',
              image: productModel.image,
              width: 100,
              height: 100,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}
