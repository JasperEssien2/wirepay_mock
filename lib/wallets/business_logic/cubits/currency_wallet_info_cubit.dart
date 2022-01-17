import 'package:flutter_utilities/utilities.dart';

import '../../wallet_export.dart';

class CurrencyWalletInfoCubit extends BaseListCubit<CurrencyWalletAmount> {
  CurrencyWalletInfoCubit({
    required CurrencyWalletViewModel viewModel,
    required this.service,
  }) : super(viewModel);

  final WalletService service;

  void fetchUserWalletInfo({int page = 1}) async {
    _firstPage(page) ? emitListLoading() : emitBottomListLoading();

    await Future.delayed(const Duration(milliseconds: 2500));

    HandleRequestResponse.handleResponse<List<CurrencyWalletAmount>>(
      () => service.getWalletInfo(page: page),
      (response) {
        viewModel.addToList(response.value, clear: _firstPage(page));
        emitListLoaded(response.value);
      },
      (error) => emitListError(error),
    );
  }

  bool _firstPage(int page) => page == 1;
}
