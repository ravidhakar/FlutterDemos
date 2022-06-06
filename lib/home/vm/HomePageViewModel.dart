import 'package:flutter/material.dart';

import '../../datamodel/User.dart';

class HomePageViewModel extends ChangeNotifier {
  bool _isLoading = false;

  bool get loading => _isLoading;

  User? _user;
  User? get userInfo=>_user;

  getUserInfo() async{
    setLoading(true);
    print("start-loading");
    await Future.delayed(const Duration(seconds: 10), () {
      _user = User(
          name: "Ravi Dhakar",
          icon: const AssetImage("images/launcher_icon.png"));
      print("data fetched");
    });
    setLoading(false);
    print("end-loading");
  }

  setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }
}
