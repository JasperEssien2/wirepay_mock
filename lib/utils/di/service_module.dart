import 'package:get_it/get_it.dart';
import 'package:wirepay_mock/shared_resources/shared_resources_exports.dart';
import 'package:wirepay_mock/wallets/business_logic/business_logic_export.dart';

Future init(GetIt injector) async {
  injector
      .registerLazySingleton<UserService>(() => DummyUserDetailService());

  injector.registerLazySingleton<WalletService>(() => DummyWalletService());
}
