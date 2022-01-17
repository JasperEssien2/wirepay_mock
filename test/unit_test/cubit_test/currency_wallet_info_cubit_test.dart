import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_utilities/utilities.dart';
import 'package:mocktail/mocktail.dart';
import 'package:wirepay_mock/wallets/business_logic/business_logic_export.dart';

import '../mocks/wallet_service_mock.dart';

void main() {
  BaseListCubitTestHelper<CurrencyWalletInfoCubit, CurrencyWalletAmount>
      testHelper =
      BaseListCubitTestHelper<CurrencyWalletInfoCubit, CurrencyWalletAmount>();

  late CurrencyWalletInfoCubit cubit;
  late CurrencyWalletViewModel viewModel;
  late MockedWalletService service;

  testHelper.setUp(
    () {
      viewModel = CurrencyWalletViewModel();
      service = MockedWalletService();
      cubit = CurrencyWalletInfoCubit(service: service, viewModel: viewModel);
    },
  );

  testHelper.setup();

  group(
    "Test fetchUserWalletInfo()",
    () {
      group(
        "Test success",
        () {
          testHelper.testInitialBaseListSuccess(
            build: () {
              _setupInitialMockSuccess(viewModel, service);

              return cubit;
            },
            whenText:
                " fetchUserWalletInfo(page=1) called and request was was successful!"
                " Ensure list was cleared before inserting new items",
            act: (cubit) => cubit.fetchUserWalletInfo(),
            verify: (cubit) => verify(() => service.getWalletInfo(page: 1)),
            cubitListExpected: _dummyList,
            viewModelListExpected: _dummyList,
          );

          testHelper.testNextBaseListSuccess(
            build: () {
              _setupNextMockSuccess(viewModel, service);
              return cubit;
            },
            whenText:
                " fetchUserWalletInfo(page=2) called and request was was successful!"
                " Ensure that previous items in list were retained",
            act: (cubit) => cubit.fetchUserWalletInfo(page: 2),
            verify: (cubit) => verify(() => service.getWalletInfo(page: 2)),
            cubitListExpected: _dummyList2,
            viewModelListExpected: _dummyList..addAll(_dummyList2),
          );
        },
      );

      group(
        "Test error",
        () {
          testHelper.testInitialBaseListError(
            build: () {
              _setupErrorMock(service, 1);

              return cubit;
            },
            whenText: " fetchUserWalletInfo(page=1) called and request fails",
            act: (cubit) => cubit.fetchUserWalletInfo(),
            verify: (_) => verify(() => service.getWalletInfo(page: 1)),
            error: 'An error occurred',
          );

          testHelper.testNextBaseListError(
            build: () {
              _setupErrorMock(service, 2);

              return cubit;
            },
            whenText: " fetchUserWalletInfo(page=2) called and request fails",
            act: (cubit) => cubit.fetchUserWalletInfo(page: 2),
            verify: (_) => verify(() => service.getWalletInfo(page: 2)),
            error: 'An error occurred',
          );
        },
      );
    },
  );
}

void _setupErrorMock(MockedWalletService service, int page) {
  when(() => service.getWalletInfo(page: page)).thenThrow(
    RequestFailedException(ErrorResponse(errorMessage: 'An error occurred')),
  );
}

void _setupInitialMockSuccess(
    CurrencyWalletViewModel viewModel, MockedWalletService service) {
  viewModel.itemList = _dummyList2;
  when(() => service.getWalletInfo())
      .thenAnswer((_) => Future.value(SuccessResponse(_dummyList)));
}

void _setupNextMockSuccess(
    CurrencyWalletViewModel viewModel, MockedWalletService service) {
  viewModel.itemList = _dummyList;
  when(() => service.getWalletInfo(page: 2))
      .thenAnswer((_) => Future.value(SuccessResponse(_dummyList2)));
}

List<CurrencyWalletAmount> get _dummyList => [
      const CurrencyWalletAmount.dummy(),
    ];

List<CurrencyWalletAmount> get _dummyList2 => [
      const CurrencyWalletAmount.dummy()
          .copyWith(country: 'Germany', currencyCode: 'EUR'),
    ];
