import 'package:intl/intl.dart';

extension FormatterExtension on double {
  String get currentcyPTBR {
    final currentcyFormat =
        NumberFormat.currency(locale: 'pt_BR', symbol: r'R$');
    return currentcyFormat.format(this);
  }
}
