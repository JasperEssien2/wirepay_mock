import 'package:intl/intl.dart';

class IntlUtil {
  static String formatCurrencyInput(String amount, String currencyCode,
      [bool ignoreSymbol = false, int decimalDigits = 2]) {
    final formatter = NumberFormat.currency(
      locale: "en_NG",
      name: currencyCode,
      symbol: '',
      decimalDigits: decimalDigits,
    );
    amount = amount.replaceAll(RegExp(r'[^0-9\.]'), "");
    final amountDouble = double.tryParse(amount);
    if (amountDouble == null) {
      return "";
    }
    return formatter.format(amountDouble);
  }
}
