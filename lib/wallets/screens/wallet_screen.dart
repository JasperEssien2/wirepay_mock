import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wirepay_mock/shared_resources/shared_resources_exports.dart';
import 'package:wirepay_mock/utils/theme/colors.dart';
import 'package:wirepay_mock/wallets/screens/widgets/wallet_appbar.dart';
import 'package:wirepay_mock/wallets/wallet_export.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final walletCubit = BlocProvider.of<CurrencyWalletInfoCubit>(context);

    return Scaffold(
      appBar: PreferredSize(
        child: const WalletAppbar(),
        preferredSize: Size(size.width, size.height * 0.3),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.grey[200],
            width: size.width,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: const Text(
              'WALLETS',
              style: TextStyle(
                color: textDarkColor,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Flexible(
            child: PaginatedListView<CurrencyWalletAmount>(
              loadingShimmerItem: (_, __) => const ItemCurrencyAmountShimmer(),
              itemBuilder: (_, index, model) =>
                  ItemCurrencyAmount(currencyAmount: model),
              cubit: walletCubit,
              loadMoreAction: () => walletCubit.fetchUserWalletInfo(page: 2),
              emptyListWidget: ErrorInfoWidget(
                caption: 'You have no wallet',
                actionText: 'Create Wallet',
                btnAction: () => null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
