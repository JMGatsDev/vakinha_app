import 'package:flutter/material.dart';
import 'package:vakinha_app/core/ui/styles/constants.dart';

class DeliveryButton extends StatelessWidget {
  const DeliveryButton(
      {super.key,
      required this.onPressed,
      required this.label,
      this.width,
      this.height = 50});

  final VoidCallback? onPressed;
  final String label;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          label,
          style: MyTextStyles.textButtonLabel,
        ),
      ),
    );
  }
}
