import 'package:flutter/material.dart';
import 'package:vakinha_app/core/ui/widgets/delivery_button.dart';

import '../../core/config/env/env.dart';
import '../../core/ui/styles/constants.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Splash'),
      ),
      body: Column(
        children: [
          Container(),
          DeliveryButton(
            onPressed: () {},
            text: Env.i['backend_base_url'] ?? '',
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'text'),
          ),
        ],
      ),
    );
  }
}
