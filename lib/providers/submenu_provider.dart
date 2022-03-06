import 'package:flutter/material.dart';
import 'package:irle_ref2/models/submenu_model.dart';
import 'package:irle_ref2/services/submenu_service.dart';

class SubmenuProvider with ChangeNotifier {
  List<SubmenuModel> _submenus = [];
  // getter
  List<SubmenuModel> get submenus => _submenus;
  // setter
  set submenus(List<SubmenuModel> submenus) {
    _submenus = submenus;
    notifyListeners();
  }

  Future<void> getSubmenus(id) async {
    try {
      List<SubmenuModel> submenus = await SubmenuService().gatSubmenuModel(id);
      _submenus = submenus;
      print(submenus);
    } catch (e) {
      print(e);
    }
  }
}
