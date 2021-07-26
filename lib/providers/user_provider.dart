import 'package:flutter/material.dart';
import 'package:job_searcher/models/user_model.dart';

class UserProvider with ChangeNotifier {
  late UserModel _userModel;

  UserModel get userModel => this._userModel;

  set userModel(UserModel value) {
    this._userModel = value;
    notifyListeners();
  }
}
