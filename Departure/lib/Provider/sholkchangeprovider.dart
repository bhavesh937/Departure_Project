import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import '../Model/chapter_model.dart';
import '../Model/shlokchangemodel.dart';

class ShlokJsonDecodeProvider extends ChangeNotifier {
  ShlokJsonDecodeModel shlokJsonDecodeModel = ShlokJsonDecodeModel(
    data: '',
    decodedList: [],
    allShloks: [],
  );

  Future<void> loadJSON(List list) async {
    shlokJsonDecodeModel.data =
        await rootBundle.loadString(list[chapterIndex].jsonPath);

    shlokJsonDecodeModel.decodedList = jsonDecode(shlokJsonDecodeModel.data);

    shlokJsonDecodeModel.allShloks = shlokJsonDecodeModel.decodedList
        .map(
          (e) => ChapterModel.fromMap(
            data: e,
          ),
        )
        .toList();
    notifyListeners();
  }

  englishLanguage() {
    shlokJsonDecodeModel.allShloks[shlokIndex].translation =
        shlokJsonDecodeModel.allShloks[shlokIndex].english;
    notifyListeners();
  }

  hindiLanguage() {
    shlokJsonDecodeModel.allShloks[shlokIndex].translation =
        shlokJsonDecodeModel.allShloks[shlokIndex].hindi;
    notifyListeners();
  }

  gujaratiLanguage() {
    shlokJsonDecodeModel.allShloks[shlokIndex].translation =
        shlokJsonDecodeModel.allShloks[shlokIndex].gujarati;
    notifyListeners();
  }
}
