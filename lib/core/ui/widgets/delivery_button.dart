import 'package:flutter/material.dart';

import '../styles/constants.dart';

class DeliveryButton extends StatelessWidget {
  const DeliveryButton(
      {super.key,
      required this.text,
      this.onPressed,
       this.width,
       this.height});

  final String text;
  final VoidCallback? onPressed;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: MyTextStyles.textButtonLabel,
      ),
    );
  }
}
