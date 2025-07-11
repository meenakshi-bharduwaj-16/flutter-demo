
import 'package:flutter/cupertino.dart';

class AuthService extends ChangeNotifier {
  bool _loggedIn = false;
  bool get isLoggedIn => _loggedIn;

  void login() {
    _loggedIn = true;
    notifyListeners();
  }

  void logout() {
    _loggedIn = false;
    notifyListeners();
  }
}