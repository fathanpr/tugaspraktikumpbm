import 'package:flutter/cupertino.dart';

// ignore: camel_case_types
class stateManagement extends ChangeNotifier{
  bool _isObsecure = true;
  bool get isObsecure => _isObsecure;

  obsecure() {
    _isObsecure = !_isObsecure;
    notifyListeners();
  }
}