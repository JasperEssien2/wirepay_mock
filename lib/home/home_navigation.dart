import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:wirepay_mock/main.dart';
import 'package:wirepay_mock/shared_resources/shared_resources_exports.dart';
import 'package:wirepay_mock/utils/utils_export.dart';
import 'package:wirepay_mock/wallets/wallet_export.dart';

class HomeNavigation extends StatefulWidget {
  const HomeNavigation({Key? key}) : super(key: key);

  @override
  _HomeNavigationState createState() => _HomeNavigationState();
}

class _HomeNavigationState extends State<HomeNavigation> {
  int _currentIndex = 0;
  final userDetailCubit = injector.get<UserDetailsCubit>();
  final walletCubit = injector.get<CurrencyWalletInfoCubit>();

  @override
  void initState() {
    userDetailCubit.fetchUserDetail();
    walletCubit.fetchUserWalletInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: _providers(),
      child: BlocBuilder<HomeNavigationCubit, HomeNavigationState>(
        builder: (context, state) {
          _setCurrentPage(state);
          return Scaffold(
            bottomNavigationBar: Card(
              elevation: 8,
              margin: const EdgeInsets.only(bottom: 0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: SalomonBottomBar(
                currentIndex: _currentIndex,
                onTap: (page) {
                  _onNavItemTapped(page, context);
                },
                itemPadding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
                items: allNavigation
                    .map(
                      (nav) => SalomonBottomBarItem(
                        selectedColor: accentColor,
                        unselectedColor: Colors.grey[350],
                        icon: Icon(nav.icon, size: 24, color: Colors.grey),
                        activeIcon:
                            Icon(nav.icon, size: 24, color: accentColor),
                        title: Text(nav.title),
                      ),
                    )
                    .toList(),
              ),
            ),
            body: IndexedStack(
              index: _currentIndex,
              children: [
                const WalletScreen(),
                Container(),
                Container(),
                Container(),
              ],
            ),
          );
        },
      ),
    );
  }

  List<BlocProvider> _providers() {
    return [
      BlocProvider<UserDetailsCubit>.value(value: userDetailCubit),
      BlocProvider<HomeNavigationCubit>.value(
          value: injector.get<HomeNavigationCubit>()),
      BlocProvider<CurrencyWalletInfoCubit>.value(
        value: walletCubit,
      ),
    ];
  }

  void _onNavItemTapped(int page, BuildContext context) {
    final _homeNavigationCubit = BlocProvider.of<HomeNavigationCubit>(context);
    switch (page) {
      case 0:
        _homeNavigationCubit.walletTabClicked();
        break;
      case 1:
        _homeNavigationCubit.cardsTabClicked();
        break;
      case 2:
        _homeNavigationCubit.transactionsTabClicked();
        break;
      case 3:
        _homeNavigationCubit.profileTabClicked();
        break;
    }
  }

  void _setCurrentPage(state) {
    if (state is OpenWalletPage) {
      _currentIndex = 0;
    } else if (state is OpenCardsPage) {
      _currentIndex = 1;
    } else if (state is OpenTransactionPage) {
      _currentIndex = 2;
    } else if (state is OpenProfilePage) {
      _currentIndex = 3;
    }
  }
}

class Navigation {
  const Navigation(this.title, this.icon, {this.isActive = false});

  final String title;
  final IconData icon;
  final bool isActive;
}

const List<Navigation> allNavigation = <Navigation>[
  Navigation('Wallets', Icons.account_balance_wallet_outlined),
  Navigation('Cards', Icons.credit_card_outlined),
  Navigation('Transaction', Icons.bar_chart_outlined),
  Navigation('Profile', Icons.person_outline_outlined),
];
