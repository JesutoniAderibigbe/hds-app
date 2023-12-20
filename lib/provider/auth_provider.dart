import 'package:flutter/material.dart';
import 'package:hds_app/models/user.dart';
import 'package:provider/provider.dart';

class UserProvider extends ChangeNotifier {
  User? _user;

  User? get user => _user;

  void setName(String name) {
    _user ??= User(name: '', email: '', phoneNumber: '');
    _user!.name = name;
    notifyListeners();
  }

  void setEmail(String email) {
    _user ??= User(name: '', email: '', phoneNumber: '');
    _user!.email = email;
    notifyListeners();
  }

  void setPhoneNumber(String phoneNumber) {
    _user ??= User(name: '', email: '', phoneNumber: '');
    _user!.phoneNumber = phoneNumber;
    notifyListeners();
  }
}
