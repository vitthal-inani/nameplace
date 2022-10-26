import 'package:flutter/material.dart';

class UserData extends ChangeNotifier {
  String _name = "";

  String get name => _name;

  set name(String name) {
    _name = name;
    notifyListeners();
  }
}
