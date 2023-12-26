import 'package:flutter/cupertino.dart';

import '../Model/theammodel.dart';

class TheamProvider extends ChangeNotifier {
  TheamChange theamChange = TheamChange(isDark: false);

  void ChangeTheam() {
    theamChange.isDark = !theamChange.isDark;
    notifyListeners();
  }
}
