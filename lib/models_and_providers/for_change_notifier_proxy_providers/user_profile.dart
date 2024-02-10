import 'package:flutter/material.dart';
import 'package:provider_sample/models_and_providers//for_change_notifier_proxy_providers/login_state.dart';

class UserProfile extends ChangeNotifier {
  String username = '';

  void updateFromLoginState(LoginState loginState) {
    username = loginState.isLoggedIn ? "LoggedInUser" : "Guest";
    notifyListeners();
  }
}
