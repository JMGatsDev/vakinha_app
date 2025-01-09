import 'package:flutter/material.dart';
import 'package:vakinha_app/vakinha_app.dart';

import 'core/config/env/env.dart';

Future<void> main() async {
  await Env.i.load();
  runApp(const VakinhaApp());
}
