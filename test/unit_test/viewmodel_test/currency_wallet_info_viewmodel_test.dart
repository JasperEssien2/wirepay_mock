import 'package:flutter_test/flutter_test.dart';
import 'package:wirepay_mock/wallets/business_logic/business_logic_export.dart';

void main() {
  late CurrencyWalletViewModel viewModel;

  setUp(
    () {
      viewModel = CurrencyWalletViewModel();
    },
  );

  group(
    "Test addToList",
    () {
      test(
        'Ensure previous list is cleared, when clear is set to true',
        () {
          viewModel.itemList = [
            const CurrencyWalletAmount.dummy().copyWith(currencyCode: 'EUR')
          ];

          viewModel
              .addToList([const CurrencyWalletAmount.dummy()], clear: true);

          expect(viewModel.itemList, [const CurrencyWalletAmount.dummy()]);
        },
      );

      test(
        'Ensure previous list is retained, when clear is set to false',
        () {
          viewModel.itemList = [
            const CurrencyWalletAmount.dummy().copyWith(currencyCode: 'EUR')
          ];

          viewModel
              .addToList([const CurrencyWalletAmount.dummy()], clear: false);

          expect(
            viewModel.itemList,
            [
              const CurrencyWalletAmount.dummy().copyWith(currencyCode: 'EUR'),
              const CurrencyWalletAmount.dummy(),
            ],
          );
        },
      );
    },
  );

  group(
    "Test clearList()",
    () {
      test(
        'Ensure that list is cleared when clearList()',
        () {
          viewModel.itemList = [
            const CurrencyWalletAmount.dummy().copyWith(currencyCode: 'EUR')
          ];

          viewModel.clearList();

          expect(viewModel.itemList, []);
        },
      );
    },
  );
}
