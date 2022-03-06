import 'package:flutter/material.dart';
import 'package:irle_ref2/models/status_model.dart';
import 'package:irle_ref2/services/status_service.dart';

class StatusProvider with ChangeNotifier {
  List<StatusModel> _statuses = [];
  // getter
  List<StatusModel> get statuses => _statuses;
  // setter
  set statuses(List<StatusModel> statuses) {
    _statuses = statuses;
    notifyListeners();
  }

  Future<void> getStatuses(id) async {
    try {
      List<StatusModel> statuses = await StatusService().getStatus(id);
      _statuses = statuses;
      print(statuses);
    } catch (e) {
      print(e);
    }
  }

  Future<bool> add(
      String token, int idMateri, int score, int userId, int idSubmenu) async {
    try {
      if (await StatusService()
          .add(token, idMateri, score, userId, idSubmenu)) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
}
