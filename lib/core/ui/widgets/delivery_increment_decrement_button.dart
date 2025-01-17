import 'package:flutter/material.dart';
import 'package:vakinha_app/core/ui/styles/constants.dart';

class DeliveryIncrementDecrementButton extends StatelessWidget {
  final int amout;
  final VoidCallback incrementTap;
  final VoidCallback decrementTap;

  const DeliveryIncrementDecrementButton(
      {super.key,
      required this.amout,
      required this.incrementTap,
      required this.decrementTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(7),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: decrementTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                '-',
                style: MyTextStyles.textMedium
                    .copyWith(fontSize: 22, color: Colors.grey),
              ),
            ),
          ),
          Text(
            amout.toString(),
            style: MyTextStyles.textRegular.copyWith(
              fontSize: 17,
              color: ColorsApp.secondary,
            ),
          ),
          InkWell(
            onTap: incrementTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                '+',
                style: MyTextStyles.textMedium
                    .copyWith(fontSize: 22, color: ColorsApp.secondary),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
