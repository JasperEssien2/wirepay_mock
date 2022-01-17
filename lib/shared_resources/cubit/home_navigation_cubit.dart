import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_navigation_state.dart';

class HomeNavigationCubit extends Cubit<HomeNavigationState> {
  HomeNavigationCubit() : super(HomeNavigationInitial());

  void walletTabClicked() => emit(OpenWalletPage());

  void cardsTabClicked() => emit(OpenCardsPage());

  void transactionsTabClicked() => emit(OpenTransactionPage());

  void profileTabClicked() => emit(OpenProfilePage());
}
