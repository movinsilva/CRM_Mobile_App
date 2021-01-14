import 'package:flutter/material.dart';

class TabViewModel extends ChangeNotifier {

  // hold the current index of the tab layout
  int _index = 0;

  int get index => _index;

  set index(int value) {
    _index = value;
    notifyListeners();
  }
}