import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getxkatalog/controllers/popupC.dart';
import 'package:getxkatalog/models/katalog_model.dart';
import 'package:get/get.dart';

class PopUpIten extends StatelessWidget {
  Katalog? katalog;

  PopUpIten({super.key, required this.katalog});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        title: Text(katalog!.judulBuku!),
      ),
    );
  }
}
