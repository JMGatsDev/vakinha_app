import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vakinha_app/core/extensions/formatter_extension.dart';
import 'package:vakinha_app/core/ui/base_state/base_state.dart';
import 'package:vakinha_app/core/ui/helpers/size_extensions.dart';
import 'package:vakinha_app/core/ui/styles/constants.dart';
import 'package:vakinha_app/core/ui/widgets/delivery_increment_decrement_button.dart';
import 'package:vakinha_app/dto/order_product_dto.dart';
import 'package:vakinha_app/models/product_model.dart';
import 'package:vakinha_app/pages/product_datail/product_detail_controller.dart';

import '../../core/ui/widgets/delivery_appbar.dart';

class ProductDatailPage extends StatefulWidget {
  final ProductModel productModel;
  final OrderProductDto? orderProductDto;

  const ProductDatailPage(
      {super.key, required this.productModel, this.orderProductDto});

  @override
  State<ProductDatailPage> createState() => _ProductDatailPageState();
}

class _ProductDatailPageState
    extends BaseState<ProductDatailPage, ProductDetailController> {
  @override
  void initState() {
    final amount = widget.orderProductDto?.amount ?? 1;
    context
        .read<ProductDetailController>()
        .initial(amount, widget.orderProductDto != null);
    super.initState();
  }

  void _showCorfimDelete(int amount) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Deseja excluir Produto ?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Canceler',
                  style: MyTextStyles.textBold.copyWith(color: Colors.red),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop(
                    OrderProductDto(
                        productModel: widget.productModel,
                        amount: amount),
                  );
                },
                child: Text(
                  'Confirmar',
                  style: MyTextStyles.textBold.copyWith(color: Colors.green),
                ),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: context.screenWidth,
            height: context.percentHeight(0.4),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(widget.productModel.image),
                  fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            height: context.percentHeight(0.01),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              widget.productModel.name,
              style: MyTextStyles.textExtraBold.copyWith(fontSize: 22),
            ),
          ),
          SizedBox(
            height: context.percentHeight(0.01),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: SingleChildScrollView(
                child: Text(
                  widget.productModel.description,
                ),
              ),
            ),
          ),
          const Divider(
            color: Colors.black,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                height: 68,
                width: context.percentWidth(0.5),
                child: BlocBuilder<ProductDetailController, int>(
                  builder: (context, amount) {
                    return DeliveryIncrementDecrementButton(
                      amout: amount,
                      incrementTap: () {
                        controller.increment();
                      },
                      decrementTap: () {
                        controller.decrement();
                      },
                    );
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                width: context.percentWidth(0.5),
                height: 68,
                child: BlocBuilder<ProductDetailController, int>(
                  builder: (context, amount) {
                    return ElevatedButton(
                      style: amount == 0
                          ? ElevatedButton.styleFrom(
                              backgroundColor: Colors.red)
                          : null,
                      onPressed: () {
                        if (amount == 0) {
                          _showCorfimDelete(amount);
                        } else {
                          Navigator.of(context).pop(
                            OrderProductDto(
                                productModel: widget.productModel,
                                amount: amount),
                          );
                        }
                      },
                      child: Visibility(
                        visible: amount > 0,
                        replacement: Text(
                          'Excluir Produto',
                          style: MyTextStyles.textExtraBold
                              .copyWith(color: Colors.white),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Adicionar",
                              style: MyTextStyles.textExtraBold
                                  .copyWith(fontSize: 13, color: Colors.white),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: AutoSizeText(
                                (widget.productModel.price * amount)
                                    .currentcyPTBR,
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                minFontSize: 5,
                                maxFontSize: 13,
                                style: MyTextStyles.textExtraBold.copyWith(
                                    fontSize: 13, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
