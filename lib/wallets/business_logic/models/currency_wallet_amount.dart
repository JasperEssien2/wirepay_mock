import 'package:equatable/equatable.dart';

class CurrencyWalletAmount extends Equatable {
  const CurrencyWalletAmount(
      {required this.flag,
      required this.country,
      required this.currencyName,
      required this.currencyCode,
      this.amount = 0.0});

  final String flag;
  final String country;
  final String currencyName;
  final String currencyCode;
  final double amount;

  @override
  List<Object> get props => [
        flag,
        country,
        currencyName,
        currencyCode,
        amount,
      ];

  CurrencyWalletAmount copyWith(
      {String? flag,
      String? country,
      String? currencyName,
      String? currencyCode,
      double? amount}) {
    return CurrencyWalletAmount(
      flag: flag ?? this.flag,
      country: country ?? this.country,
      currencyName: currencyName ?? this.currencyName,
      currencyCode: currencyCode ?? this.currencyCode,
      amount: amount ?? this.amount,
    );
  }

  const CurrencyWalletAmount.dummy()
      : flag = '',
        country = 'Nigeria',
        currencyCode = 'NGN',
        amount = 0.0,
        currencyName = 'Naira';
}
