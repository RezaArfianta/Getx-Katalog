import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import 'package:kataloggetx/models/katalog_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class KatalogController extends GetxController {
  final TextEditingController InputController = TextEditingController();
  var listKatalog = <Katalog>[].obs;
  var isLoading = false.obs;
  KatalogResponse? inikatalog;
  ScrollController _scrollController = ScrollController();
  int page = 1;
  String keyword = '';
  bool hasMore = true;

  @override
  onInit() {
    super.onInit();
    _scrollController.addListener(() async {
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.offset) {
        page = page + 1;
        print('ok $page ${listKatalog.length}');
      }
    });
  }

  cetak() {
    print("cetak");
  }

  Future<void> getKatalog() async {
    try {
      isLoading(true);
      http.Response response = await http.get(Uri.tryParse(
          'https://demo-service.kemenkeu.go.id/perpustakaan/Koleksi/GetAll?PageSize=10&Page=$page&keyword=$keyword')!);
      print('konek api');

      if (response.statusCode == 200) {
        Map result = jsonDecode(response.body);
        print('dapet data');

        List<dynamic> listDyn = result["Data"];
        List<Katalog> listKatalog = [];
        listDyn.forEach((element) {
          listKatalog.add(Katalog.fromJson(element));
        });

        this.listKatalog.value = listKatalog;
        this.listKatalog.refresh();
        print('sampe sini');

        print('kebaca');
      } else {}
    } catch (e) {
      print('error');
    } finally {
      isLoading(false);
    }
  }

  
    

    // fetch(int page, String keyword) async {
    //   inikatalog = await KatalogController.getKatalog(page, keyword);
    // if (inikatalog != null) {
    //   listKatalog.addAll(inikatalog!.data!);
    //   inikatalog!.data!.forEach((element) {});
    //   hasMore = page * 10 <= inikatalog!.total!;
    // }
    // }
    // readData(BuildContext context) async {
    //   isLoading.value = true;
    //   await Future.delayed(Duration(seconds: 2));
    //   await DefaultAssetBundle.of(context)
    //       .loadString("/models/buku.json")
    //       .then((s) {
    //     // listBuku.value = json.decode(s);
    //     Map jsonData = jsonDecode(s);
    //     List<dynamic> listDyn = jsonData["Data"];
    //     List<Buku> listBuku = [];
    //     listDyn.forEach(
    //       (element) {
    //         listBuku.add(Buku.fromJson(element));
    //       },
    //     );

    //     this.listBuku.value = listBuku;
    //     log(jsonEncode(jsonData["Data"]), name: "return model buku");
    //     this.listBuku.refresh();
    //   });

    //   isLoading.value = false;
    // }
  
}
    // fetch(page, '');

    // _scrollController.addListener(() {
    //   if (_scrollController.position.maxScrollExtent ==
    //       _scrollController.offset) {
    //     page = page + 1;
    //     print('ok $page ${listKatalog.length}');
    //     fetch(page, keyword);
    //   }
    // });