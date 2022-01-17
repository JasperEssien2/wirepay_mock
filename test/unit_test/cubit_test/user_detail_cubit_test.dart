import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_utilities/utilities.dart';
import 'package:mocktail/mocktail.dart';
import 'package:wirepay_mock/shared_resources/shared_resources_exports.dart';

import '../mocks/user_service_mock.dart';

void main() {
  BaseObjectCubitTestHelper<UserDetailsCubit, UserDetail> testHelper =
      BaseObjectCubitTestHelper<UserDetailsCubit, UserDetail>();

  late UserDetailsCubit cubit;
  late MockedUserService service;
  late UsersDetailViewModel viewModel;

  testHelper.setUp(
    () {
      viewModel = UsersDetailViewModel();
      service = MockedUserService();
      cubit = UserDetailsCubit(service: service, viewModel: viewModel);
    },
  );

  testHelper.setup();

  group(
    "Test fetchUserDetail()",
    () {
      testHelper.testBaseObjectSuccess(
        build: () {
          _setupMockSuccess(service);
          return cubit;
        },
        whenText: " cubit.fetchUserDetail() called and request was successful",
        act: (cubit) => cubit.fetchUserDetail(),
        verify: (cubit) {
          verify(() => service.fetchUserDetail()).called(1);
          expect(viewModel.userDetail, _dummyUser);
        },
        objectExpected: _dummyUser,
      );

      testHelper.testBaseObjectError(
        build: () {
          _setupMockError(service);
          return cubit;
        },
        whenText: " cubit.fetchUserDetail() called and request fails",
        act: (cubit) => cubit.fetchUserDetail(),
        verify: (cubit) => verify(() => service.fetchUserDetail()).called(1),
        error: 'An error occurred',
      );
    },
  );
}

void _setupMockSuccess(MockedUserService service) {
  when(() => service.fetchUserDetail()).thenAnswer(
    (_) => Future.value(SuccessResponse(_dummyUser)),
  );
}

void _setupMockError(MockedUserService service) {
  when(() => service.fetchUserDetail()).thenThrow(
      RequestFailedException(ErrorResponse(errorMessage: 'An error occurred')));
}

UserDetail get _dummyUser =>
    const UserDetail(email: 'jas@gmail.com', name: 'Jasper');
