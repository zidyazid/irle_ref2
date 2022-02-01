import 'package:flutter/material.dart';
import 'package:irle_ref2/models/memorizing_detail_model.dart';
import 'package:irle_ref2/services/memorizing_detail_service.dart';

class MemorizingDetailProvider with ChangeNotifier {
  List<MemorizingDetailModel> _memorizingDetail = [];
  // getter
  List<MemorizingDetailModel> get memorizingDetails => _memorizingDetail;
  // settet
  set memorizingDetails(List<MemorizingDetailModel> memorizingDetails) {
    _memorizingDetail = memorizingDetails;
    notifyListeners();
  }

  Future<void> getMemorizingDetail(int id) async {
    try {
      List<MemorizingDetailModel> memorizingDetails =
          await MemorizingDetailService().getMemorizingDetail(id);
      _memorizingDetail = memorizingDetails;
      print(memorizingDetails);
    } catch (e) {
      print(e);
    }
  }

  Future<bool> add(String token, int userId, int kosakataId) async {
    try {
      if (await MemorizingDetailService().add(token, userId, kosakataId)) {
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
