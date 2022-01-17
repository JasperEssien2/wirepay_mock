import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_utilities/utilities.dart';
import 'package:stacked/stacked.dart';
import 'package:wirepay_mock/shared_resources/shared_resources_exports.dart';
import 'package:wirepay_mock/utils/utils_export.dart';

class WalletAppbar extends StatelessWidget {
  const WalletAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: appColor,
      alignment: Alignment.bottomLeft,
      padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const _UserDetailWidget(),
          const SizedBox(height: 24),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                flex: 1,
                child: CustomButton(
                  onPressed: () => null,
                  text: "FUND WALLET",
                ),
              ),
              const SizedBox(width: 24),
              Flexible(
                flex: 1,
                child: CustomButton(
                  onPressed: () => null,
                  text: "WITHDRAW",
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _UserDetailWidget extends ViewModelBuilderWidget<UsersDetailViewModel> {
  const _UserDetailWidget({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, viewModel, _) {
    final state =
        BlocProvider.of<UserDetailsCubit>(context, listen: true).state;

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (state is BaseObjectLoading)
                WidgetUtil.shimmerColorWidget(
                  Container(
                    height: 16,
                    width: 130,
                    decoration: WidgetUtil.buildShimmerBoxDecoration,
                  ),
                )
              else
                Text(
                  "Hello ${viewModel.userDetail == null ? 'Anonymous' : viewModel.userDetail!.name}",
                  style: const TextStyle(
                    fontSize: 16,
                    color: textLightColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              const SizedBox(height: 8),
              const Text(
                "What would you like to do today?",
                style: TextStyle(
                  fontSize: 14,
                  color: textLightColorFaded,
                ),
              ),
            ],
          ),
        ),
        const Icon(
          Icons.qr_code,
          size: 40,
          color: Colors.white,
        )
      ],
    );
  }

  @override
  UsersDetailViewModel viewModelBuilder(BuildContext context) =>
      BlocProvider.of<UserDetailsCubit>(context).viewModel;

  @override
  bool get disposeViewModel => false;
}
