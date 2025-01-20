import 'package:flutter/material.dart';
import 'package:vakinha_app/core/extensions/formatter_extension.dart';
import 'package:vakinha_app/core/ui/helpers/size_extensions.dart';
import 'package:vakinha_app/core/ui/styles/constants.dart';
import 'package:vakinha_app/dto/order_product_dto.dart';

class ShoppinBagWidget extends StatelessWidget {
  const ShoppinBagWidget({super.key, required this.bag});

  final List<OrderProductDto> bag;

  @override
  Widget build(BuildContext context) {
    final totalBag = bag
        .fold<double>(0.0, (total, element) => total += element.totalPrice)
        .currentcyPTBR;
    return Container(
      padding: EdgeInsets.all(15),
      width: context.screenWidth,
      height: context.percentHeight(0.1),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5,
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: ElevatedButton(
        onPressed: () {},
        child: Stack(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Icon(
                Icons.shopping_cart_outlined,
                color: Colors.white,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Ver Sacola',
                style: MyTextStyles.textExtraBold.copyWith(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                totalBag,
                style: MyTextStyles.textExtraBold.copyWith(
                  color: Colors.white,
                  fontSize: 11,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
