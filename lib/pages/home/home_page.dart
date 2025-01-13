import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vakinha_app/core/ui/helpers/messages.dart';
import 'package:vakinha_app/pages/home/home_controller.dart';
import 'package:vakinha_app/pages/home/widgets/delivery_product_tile.dart';
import 'package:vakinha_app/pages/home/widgets/home_state.dart';

import '../../core/ui/helpers/loader.dart';
import '../../core/ui/widgets/delivery_appbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<StatefulWidget> with Loader, Messages {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<HomeController>().loadProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppBar(),
      body: BlocConsumer<HomeController, HomeState>(
        listener: (context, state) {
          if (state.status == HomeStateStatus.error) {
            showError('Falha ao carregar os produtos');
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: state.products.length,
                  itemBuilder: (context, index) {
                    final products = state.products[index];
                    return DeliveryProductTile(
                      productModel: state.products[index],
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
