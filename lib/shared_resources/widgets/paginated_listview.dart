import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_utilities/utilities.dart';
import 'package:stacked/stacked.dart';
import 'package:wirepay_mock/shared_resources/widgets/widgets_export.dart';
import 'package:wirepay_mock/utils/widget_utils.dart';

class PaginatedListView<T>
    extends ViewModelBuilderWidget<ListBaseViewModel<T>> {
  final Widget Function(BuildContext context, int index) loadingShimmerItem;
  final Widget Function(BuildContext context, int index, T item) itemBuilder;
  final BaseListCubit<T> cubit;
  final Function loadMoreAction;
  final Widget emptyListWidget;

  const PaginatedListView({
    Key? key,
    required this.loadingShimmerItem,
    required this.itemBuilder,
    required this.cubit,
    required this.loadMoreAction,
    required this.emptyListWidget,
  }) : super(key: key);

  @override
  Widget builder(
      BuildContext context, ListBaseViewModel<T> viewModel, Widget? child) {
    final size = MediaQuery.of(context).size;

    return BlocConsumer<BaseListCubit<T>, BaseListState>(
      bloc: cubit,
      listener: (context, state) {
        if (state is BaseListError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error)),
          );
        }
      },
      builder: (context, state) {
        if (state is BaseListLoading) {
          return ListView.builder(
            itemCount: 4,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemBuilder: (_, index) => loadingShimmerItem(_, index),
          );
        }
        if (state is BaseListEmptyState) {
          return emptyListWidget;
        }

        if (state is BaseListError && cubit.viewModel.itemList.isEmpty) {
          return ErrorInfoWidget(
            width: size.width,
            height: size.height,
            caption: state.error,
            actionText: 'Retry',
            btnAction: () => loadMoreAction(),
          );
        }

        return NotificationListener<ScrollNotification>(
          onNotification: (notification) => WidgetUtil.handleScrollNotification(
            notification,
            () => (state is BaseBottomListLoading) ? null : loadMoreAction(),
          ),
          child: ListView.separated(
            itemCount: viewModel.itemList.length + 2,
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(bottom: 40),
            itemBuilder: (context, index) {
              if (index >= viewModel.itemList.length) {
                return const SizedBox.shrink();
              }

              return itemBuilder(context, index, viewModel.itemList[index]);
            },
            separatorBuilder: (BuildContext context, int index) {
              if (_shouldShowButtomListLoadingItem(state, index, viewModel)) {
                return WidgetUtil.bottomListLoadingWidget();
              }
              return Container(
                width: double.infinity,
                height: 0.5,
                color: Colors.grey[300],
              );
            },
          ),
        );
      },
    );
  }

  bool _shouldShowButtomListLoadingItem(
          BaseListState state, int index, ListBaseViewModel<T> viewModel) =>
      (state is BaseBottomListLoading) &&
      (index) == (viewModel.itemList.length);

  @override
  bool get disposeViewModel => false;

  @override
  ListBaseViewModel<T> viewModelBuilder(BuildContext context) =>
      cubit.viewModel;
}
