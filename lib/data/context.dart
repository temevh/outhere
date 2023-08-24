import 'package:flutter/foundation.dart';

class AppContext extends ChangeNotifier {
  bool _completed = false;

  bool get completed => _completed;

  set completed(bool value) {
    _completed = value;
    notifyListeners();
  }
}
