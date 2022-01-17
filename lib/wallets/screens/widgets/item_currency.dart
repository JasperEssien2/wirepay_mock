import 'package:flutter/material.dart';
import 'package:wirepay_mock/utils/utils_export.dart';
import 'package:wirepay_mock/wallets/business_logic/models/currency_wallet_amount.dart';

class ItemCurrencyAmount extends StatelessWidget {
  const ItemCurrencyAmount({Key? key, required this.currencyAmount})
      : super(key: key);

  final CurrencyWalletAmount currencyAmount;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 8,
      ),
      leading: CircleAvatar(
        radius: 23,
        backgroundColor: Colors.grey[300],
        backgroundImage: NetworkImage(currencyAmount.flag),
      ),
      title: Text(
        "${currencyAmount.country} ${currencyAmount.currencyName}",
        style: const TextStyle(
          fontSize: 14,
          color: textDarkColor,
        ),
      ),
      trailing: Text(
        "${IntlUtil.formatCurrencyInput(currencyAmount.amount.toString(), currencyAmount.currencyCode)} ${currencyAmount.currencyCode}",
        style: const TextStyle(
          fontSize: 14,
          color: textDarkColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class ItemCurrencyAmountShimmer extends StatelessWidget {
  const ItemCurrencyAmountShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WidgetUtil.shimmerColorWidget(
      ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 8,
        ),
        leading: CircleAvatar(
          radius: 23,
          backgroundColor: Colors.grey[300],
        ),
        title: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            height: 19,
            width: 130,
            decoration: WidgetUtil.buildShimmerBoxDecoration,
          ),
        ),
        trailing: Container(
          height: 14,
          width: 70,
          decoration: WidgetUtil.buildShimmerBoxDecoration,
        ),
      ),
    );
  }
}
