import 'package:flutter/material.dart';


class HomeProvider extends ChangeNotifier {
  bool _isRefreshing = false;

  bool get isRefreshing => _isRefreshing;

  void setRefreshing(bool value) {
    _isRefreshing = value;
    notifyListeners();
  }
}
