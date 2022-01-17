import 'package:flutter_utilities/utilities.dart';
import 'package:wirepay_mock/shared_resources/shared_resources_exports.dart';


class UserDetailsCubit extends BaseObjectCubit<UserDetail> {
  UserDetailsCubit({required this.service, required this.viewModel});

  final UserService service;
  final UsersDetailViewModel viewModel;

  void fetchUserDetail() async {
    emitLoading();

    /// This is done to emulate a real API request
    await Future.delayed(const Duration(milliseconds: 3000));

    HandleRequestResponse.handleResponse<UserDetail>(
      () => service.fetchUserDetail(),
      _successResponse,
      (error) => emitError(error),
    );
  }

  void _successResponse(SuccessResponse<UserDetail> response) {
    viewModel.userDetail = response.value;
    emitLoaded(viewModel.userDetail!);
  }
}
