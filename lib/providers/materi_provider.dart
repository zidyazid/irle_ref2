import 'package:flutter/material.dart';
import 'package:irle_ref2/models/materi_model.dart';
import 'package:irle_ref2/services/materi_service.dart';

class MateriProvider with ChangeNotifier {
  List<MateriModel> _materies = [];
  //getter
  List<MateriModel> get materies => _materies;
  // setter
  set materies(List<MateriModel> materies) {
    _materies = materies;
    notifyListeners();
  }

  Future<void> getMateries() async {
    try {
      List<MateriModel> materies = await MateriService().getMateries();
      _materies = materies;
      print(materies);
    } catch (e) {
      print(e);
    }
  }
}
