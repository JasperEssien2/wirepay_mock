import 'package:get_it/get_it.dart';
import 'package:wirepay_mock/shared_resources/shared_resources_exports.dart';
import 'package:wirepay_mock/wallets/business_logic/business_logic_export.dart';

Future init(GetIt injector) async {
  injector.registerLazySingleton<UserDetailsCubit>(
    () => UserDetailsCubit(service: injector.get(), viewModel: injector.get()),
    dispose: (val) => val.close(),
  );

  injector.registerLazySingleton<CurrencyWalletInfoCubit>(
    () => CurrencyWalletInfoCubit(
      service: injector.get(),
      viewModel: injector.get(),
    ),
    dispose: (val) => val.close(),
  );

  injector.registerLazySingleton<HomeNavigationCubit>(
    () => HomeNavigationCubit(),
    dispose: (val) => val.close(),
  );
}
