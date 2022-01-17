import 'package:flutter_utilities/utilities.dart';
import 'package:wirepay_mock/shared_resources/model/user_detail.dart';

abstract class UserService {
  Future<SuccessResponse> fetchUserDetail();
}

class DummyUserDetailService extends UserService {
  bool returnSuccess = true;
  UserDetail dummyUserDetail =
      const UserDetail(email: 'jasper@gmail.com', name: 'Jahswill Essien');

  @override
  Future<SuccessResponse> fetchUserDetail() async {
    if (returnSuccess) {
      return SuccessResponse(dummyUserDetail);
    } else {
      throw RequestFailedException('An error occurred!');
    }
  }
}
