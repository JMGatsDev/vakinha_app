import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:vakinha_app/core/ui/helpers/size_extensions.dart';
import 'package:vakinha_app/core/ui/styles/constants.dart';

import '../../core/ui/widgets/delivery_appbar.dart';

class ProductDatailPage extends StatelessWidget {
  const ProductDatailPage({super.key});

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
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                    'https://s2-receitas.glbimg.com/w-RIgGFLB5I_mxAwM5G6exgRktE=/0x0:1080x608/924x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_e84042ef78cb4708aeebdf1c68c6cbd6/internal_photos/bs/2021/5/K/EPOEiySp2bPFu4ciALlQ/capas-para-materias-gshow-home.jpg',
                  ),
                  fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            height: context.percentHeight(0.01),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              'Nome',
              style: MyTextStyles.textExtraBold.copyWith(fontSize: 22),
            ),
          ),
          SizedBox(
            height: context.percentHeight(0.01),
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: SingleChildScrollView(
                child: Text(
                  'Descrição',
                ),
              ),
            ),
          ),
          Divider(
            color: Colors.black,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('botão'),
              Container(
                padding: const EdgeInsets.all(8),
                width: context.percentWidth(0.5),
                height: 68,
                child: ElevatedButton(
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
                          r'R$ 60,99',
                          maxLines: 1,
                          minFontSize: 5,
                          maxFontSize: 13,
                          style: MyTextStyles.textExtraBold
                              .copyWith(fontSize: 13, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
