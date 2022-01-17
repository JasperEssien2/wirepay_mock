import 'package:get_it/get_it.dart';
import 'package:wirepay_mock/shared_resources/viewmodels/users_detail_viewmodel.dart';
import 'package:wirepay_mock/wallets/business_logic/business_logic_export.dart';

Future init(GetIt injector) async {
  injector.registerFactory<CurrencyWalletViewModel>(
      () => CurrencyWalletViewModel());

  injector.registerFactory<UsersDetailViewModel>(() => UsersDetailViewModel());
}
