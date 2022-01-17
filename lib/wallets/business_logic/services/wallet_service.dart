import 'package:flutter_utilities/utilities.dart';
import 'package:wirepay_mock/wallets/business_logic/models/currency_wallet_amount.dart';

abstract class WalletService {
  Future<SuccessResponse> getWalletInfo({int page = 1});
}

class DummyWalletService extends WalletService {
  bool returnSuccessState = true;

  @override
  Future<SuccessResponse> getWalletInfo({int page = 1}) async {
    if (returnSuccessState) {
      return SuccessResponse(page == 1 ? walletInfo: walletInfoPage2);
    } else {
      throw RequestFailedException(
        ErrorResponse(errorMessage: 'An error occurred'),
      );
    }
  }

  List<CurrencyWalletAmount> get walletInfo => const [
        CurrencyWalletAmount(
          country: 'US',
          currencyCode: 'USD',
          currencyName: 'Dollar',
          amount: 359.63,
          flag:
              "https://cdn.britannica.com/33/4833-004-828A9A84/Flag-United-States-of-America.jpg",
        ),
        CurrencyWalletAmount(
          country: 'Nigeria',
          currencyCode: 'NGN',
          currencyName: 'Naira',
          amount: 690998,
          flag:
              "https://upload.wikimedia.org/wikipedia/commons/thumb/7/79/Flag_of_Nigeria.svg/2560px-Flag_of_Nigeria.svg.png",
        ),
        CurrencyWalletAmount(
          country: 'Ghana',
          currencyCode: 'GHS',
          currencyName: 'Cedi',
          amount: 0.38,
          flag:
              "https://upload.wikimedia.org/wikipedia/commons/thumb/1/19/Flag_of_Ghana.svg/255px-Flag_of_Ghana.svg.png",
        ),
        CurrencyWalletAmount(
          country: 'Kenyan',
          currencyCode: 'KES',
          currencyName: 'Shilling',
          amount: 96.00,
          flag:
              "https://upload.wikimedia.org/wikipedia/commons/thumb/4/49/Flag_of_Kenya.svg/800px-Flag_of_Kenya.svg.png",
        ),
        CurrencyWalletAmount(
          country: 'South African',
          currencyCode: 'ZAR',
          currencyName: 'Rand',
          flag:
              "https://upload.wikimedia.org/wikipedia/commons/thumb/a/af/Flag_of_South_Africa.svg/1280px-Flag_of_South_Africa.svg.png",
        ),
        CurrencyWalletAmount(
          country: 'Canada',
          currencyCode: 'CAD',
          currencyName: 'Dollar',
          amount: 4000,
          flag:
              "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d9/Flag_of_Canada_%28Pantone%29.svg/1200px-Flag_of_Canada_%28Pantone%29.svg.png",
        ),
        CurrencyWalletAmount(
          country: 'Ukraine',
          currencyCode: 'UAH',
          currencyName: 'Hryvnia',
          amount: 5000,
          flag:
              "https://upload.wikimedia.org/wikipedia/commons/thumb/1/17/Flag_of_Ukraine_%28pantone_colors%29.svg/255px-Flag_of_Ukraine_%28pantone_colors%29.svg.png",
        ),
         CurrencyWalletAmount(
          country: 'Egypt',
          currencyCode: 'EGP',
          currencyName: 'Pound',
          amount: 4000,
          flag:
              "https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Flag_of_Egypt.svg/255px-Flag_of_Egypt.svg.png",
        ),
      ];

  List<CurrencyWalletAmount> get walletInfoPage2 => const [
        CurrencyWalletAmount(
          country: 'Netherlands',
          currencyCode: 'EUR',
          currencyName: 'Euro',
          amount: 600.63,
          flag:
              "https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Flag_of_the_Netherlands.svg/2560px-Flag_of_the_Netherlands.svg.png",
        ),
         CurrencyWalletAmount(
          country: 'Germany',
          currencyCode: 'EUR',
          currencyName: 'Euro',
          amount: 2600.63,
          flag:
              "https://upload.wikimedia.org/wikipedia/en/thumb/b/ba/Flag_of_Germany.svg/1200px-Flag_of_Germany.svg.png",
        ),
      ];
}
