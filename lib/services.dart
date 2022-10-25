import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:getxkatalog/models/katalog_model.dart';

class Services {
  final dio = Dio();
  Future<KatalogResponse?> getListKatalog(int page, String keyword) async {
    try {
      print("$page $keyword");
      print(
          'https://demo-service.kemenkeu.go.id/perpustakaan/Koleksi/GetAll?PageSize=10&Page=$page&keyword=$keyword');
      var response = await dio.get(
          'https://demo-service.kemenkeu.go.id/perpustakaan/Koleksi/GetAll?PageSize=10&Page=$page&keyword=$keyword');

      // print('data katalog ${response.data}');
      // log(jsonEncode(response.data), name: "data katalog");

      // if (response.statusCode == 200) {
      return KatalogResponse.fromJson(response.data);
      // } else {
      //   return null;
      // }
    } catch (e) {
      print("eror pada service ${e.toString()}");
      return null;
    }
  }

  Future<DetailKatalogResponse?> getDetailKatalog(int id) async {
    try {
      print("$id");
      Response response = await Dio()
          .get('https://demo-service.kemenkeu.go.id/perpustakaan/Koleksi/$id');
      print('popup katalog');
      print(jsonEncode(response.data));
      if (response.statusCode == 200) {
        return DetailKatalogResponse.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
//   static Future<DetailKatalogResponse?> getDetailKatalog(int id) async {
//     try {
//       var response = await Dio()
//           .get('https://demo-service.kemenkeu.go.id/perpustakaan/Koleksi/$id');
//       return DetailKatalogResponse.fromJson(response.data);
//     } catch (e) {
//       print("eror pada popup ${e.toString()}");
//       return null;
//     }
//   }
}
 
// import 'package:dio/dio.dart';

// import "models/buku.dart";

// abstract class Services {
//   static Future<List<Buku>?> getListBukuTerbaru() async {
//     try {
//       Response response = await Dio().get(
//           'https://demo-service.kemenkeu.go.id/perpustakaan/Koleksi/GetTerbaru');
//       // ignore: avoid_print
//       print('dapat data terbaru');
//       if (response.statusCode == 200) {
//         return List<Buku>.from(
//             response.data['Data'].map((i) => Buku.fromJson(i)));
//       } else {
//         return null;
//       }
//     } catch (e) {
//       // ignore: avoid_print
//       print(e);
//       return null;
//     }
//   }

//   static Future<List<Buku>?> getListBukuTerlaris() async {
//     try {
//       Response response = await Dio().get(
//           'https://demo-service.kemenkeu.go.id/perpustakaan/Koleksi/GetTerlaris');
//       print('dapat data terlaris');
//       if (response.statusCode == 200) {
//         return List<Buku>.from(
//             response.data['Data'].map((i) => Buku.fromJson(i)));
//       }
//     } catch (e) {
//       print(e);
//       return null;
//     }
//   }
// }
