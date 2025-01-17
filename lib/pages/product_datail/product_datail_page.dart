import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vakinha_app/core/extensions/formatter_extension.dart';
import 'package:vakinha_app/core/ui/base_state/base_state.dart';
import 'package:vakinha_app/core/ui/helpers/size_extensions.dart';
import 'package:vakinha_app/core/ui/styles/constants.dart';
import 'package:vakinha_app/core/ui/widgets/delivery_increment_decrement_button.dart';
import 'package:vakinha_app/models/product_model.dart';
import 'package:vakinha_app/pages/product_datail/product_detail_controller.dart';

import '../../core/ui/widgets/delivery_appbar.dart';

class ProductDatailPage extends StatefulWidget {
  final ProductModel productModel;

  const ProductDatailPage({super.key, required this.productModel});

  @override
  State<ProductDatailPage> createState() => _ProductDatailPageState();
}

class _ProductDatailPageState
    extends BaseState<ProductDatailPage, ProductDetailController> {
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
                  builder: (context, amout) {
                    return DeliveryIncrementDecrementButton(
                      amout: amout,
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
                  builder: (context, amout) {
                    return ElevatedButton(
                      onPressed: () {},
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
                              (widget.productModel.price * amout).currentcyPTBR,
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              minFontSize: 5,
                              maxFontSize: 13,
                              style: MyTextStyles.textExtraBold
                                  .copyWith(fontSize: 13, color: Colors.white),
                            ),
                          ),
                        ],
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
