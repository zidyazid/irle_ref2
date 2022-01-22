import 'package:flutter/material.dart';
import 'package:irle_ref2/models/kosa_kata_model.dart';
import 'package:irle_ref2/services/kosa_kata_services.dart';

class KosaKataProvider with ChangeNotifier {
  List<KosaKataModel> _vocabularies = [];
  // getter
  List<KosaKataModel> get vocabullaries => _vocabularies;
  // setter
  set vocabullaries(List<KosaKataModel> vocabullaries) {
    _vocabularies = vocabullaries;
    notifyListeners();
  }

  Future<void> getKosaKata() async {
    try {
      List<KosaKataModel> vocabullaries =
          await KosaKataServices().getKosaKata();
      _vocabularies = vocabullaries;
      print(vocabullaries);
    } catch (e) {
      print(e);
    }
  }
}
