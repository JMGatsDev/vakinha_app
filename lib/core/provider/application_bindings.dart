import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vakinha_app/core/rest_client/custom_dio.dart';

class ApplicationBindings extends StatelessWidget {
  final Widget child;

  const ApplicationBindings({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => CustomDio(),
        ),
      ],
      child: child,
    );
  }
}
