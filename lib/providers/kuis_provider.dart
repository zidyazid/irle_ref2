import 'package:flutter/material.dart';
import 'package:irle_ref2/models/kuis_model.dart';
import 'package:irle_ref2/services/kuis_service.dart';

class KuisProvider with ChangeNotifier {
  List<KuisModel> _kuises = [];
  //getter
  List<KuisModel> get kuises => _kuises;
  // setter
  set kuises(List<KuisModel> kuises) {
    _kuises = kuises;
    notifyListeners();
  }

  Future<void> getKuises(id) async {
    try {
      List<KuisModel> kuises = await KuisService().getKuises(id);
      _kuises = kuises;
      print(kuises);
    } catch (e) {
      print(e);
    }
  }
}
