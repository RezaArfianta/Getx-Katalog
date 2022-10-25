import 'package:getxkatalog/controllers/popupC.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxkatalog/models/katalog_model.dart';
import 'package:getxkatalog/widgets/popupiten.dart';

class KatalogPopup extends StatelessWidget {
  KatalogPopup({super.key, this.katalog});
  Katalog? katalog;

  @override
  Widget build(BuildContext context) {
    PopupController popupC = Get.put(PopupController(katalog));

    return Dialog(
        child: Container(
            margin: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
            decoration: BoxDecoration(color: Colors.white),
            height: 450,
            width: 200,
            child: ScrollConfiguration(
                behavior:
                    ScrollConfiguration.of(context).copyWith(scrollbars: false),
                child: ListView(children: <Widget>[
                  Container(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            hoverColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.close))
                      ],
                    ),
                  ),
                  Obx(() {
                    if (popupC.detail.value != null) {
                      return PopUpIten(
                        katalog: katalog,
                      );
                    } else {
                      return Text("databelumada");
                    }
                  })
                ]))));
  }
}
