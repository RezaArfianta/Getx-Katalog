import 'dart:developer';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:getxkatalog/models/katalog_model.dart';

import '../services.dart';

class PopupController extends GetxController {
  Katalog? katalog;
  DetailKatalogResponse? detail;
  var isLoading = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchPopup();
  }

  Future<void> fetchPopup() async {
    log("hai");
    try {
      isLoading(true);
      detail = await Services().getDetailKatalog(katalog!.id);
    } catch (e) {
      print(e);
    }
    isLoading(false);
  }
}
