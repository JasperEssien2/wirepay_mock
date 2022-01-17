import 'package:flutter_test/flutter_test.dart';
import 'package:wirepay_mock/shared_resources/shared_resources_exports.dart';

void main() {
  late UsersDetailViewModel usersDetailViewModel;

  setUp(
    () {
      usersDetailViewModel = UsersDetailViewModel();
    },
  );

  group(
    "Test set userDetail",
    () {
      test(
        'Ensure that correct user detail is set',
        () {
          usersDetailViewModel.userDetail =
              const UserDetail(email: 'cap@gmail.com', name: 'Cap');

          expect(usersDetailViewModel.userDetail,
              const UserDetail(email: 'cap@gmail.com', name: 'Cap'));
        },
      );
    },
  );
}
