import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vakinha_app/core/ui/base_state/base_state.dart';
import 'package:vakinha_app/pages/home/home_controller.dart';
import 'package:vakinha_app/pages/home/widgets/delivery_product_tile.dart';
import 'package:vakinha_app/pages/home/home_state.dart';

import '../../core/ui/widgets/delivery_appbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage, HomeController> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.loadProducts();
    });
  }

  @override
  void onReady() {
    controller.loadProducts();
    super.onReady();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppBar(),
      body: BlocConsumer<HomeController, HomeState>(
        listener: (context, state) {
          state.status.matchAny(
            any: hideLoader,
            loading: () => showLoader(),
            error: () {
              hideLoader();
              showError('Falha ao carregar os produtos');
            },
          );
        },
        buildWhen: (previus, current) => current.status.matchAny(
          any: () => false,
          initial: () => true,
          loaded: () => true,
        ),
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: state.products.length,
                  itemBuilder: (context, index) {
                    final product = state.products[index];
                    final orders = state.shoppingBag
                        .where((order) => order.productModel == product);
                    return DeliveryProductTile(
                      productModel: state.products[index],
                      orderProductDto: orders.isNotEmpty ? orders.first : null,
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
