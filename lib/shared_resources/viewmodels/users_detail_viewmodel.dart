import 'package:flutter/material.dart';
import 'package:wirepay_mock/shared_resources/model/user_detail.dart';

class UsersDetailViewModel extends ChangeNotifier {
   UserDetail? _userDetail;

  set userDetail(UserDetail? value) {
    if (value == _userDetail) {
      return;
    } else {
      _userDetail = value;
      notifyListeners();
    }
  }

  UserDetail? get userDetail => _userDetail;
}
