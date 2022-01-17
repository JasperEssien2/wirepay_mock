part of 'home_navigation_cubit.dart';

@immutable
abstract class HomeNavigationState extends Equatable {
  
  @override
  List<Object?> get props => [];
}

class HomeNavigationInitial extends HomeNavigationState {}

class OpenWalletPage extends HomeNavigationState {}

class OpenCardsPage extends HomeNavigationState {}

class OpenTransactionPage extends HomeNavigationState {}

class OpenProfilePage extends HomeNavigationState {}
