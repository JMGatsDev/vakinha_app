import 'package:flutter/material.dart';
import 'package:vakinha_app/core/ui/helpers/size_extensions.dart';
import 'package:vakinha_app/core/ui/widgets/delivery_button.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ColoredBox(
      color: const Color(0xFF140E0E),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: context.screenWidth,
              child: Image.asset(
                'assets/images/lanche.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              children: [
                SizedBox(
                  height: context.screenHeight * 0.3,
                ),
                Image.asset('assets/images/logo.png'),
                SizedBox(
                  height: context.screenHeight * 0.03,
                ),
                DeliveryButton(
                  width: context.percentWidth(0.6),
                  onPressed: () {
                    Navigator.of(context).popAndPushNamed('/home');
                  },
                  label: 'Acessar',
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
