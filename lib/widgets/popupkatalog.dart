import 'package:getxkatalog/controllers/katalog_controller.dart';
import 'package:getxkatalog/controllers/popupC.dart';
import 'package:getxkatalog/models/katalog_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopupKatalog extends StatefulWidget {
  PopupKatalog({Key? key, Katalog? katalog});

  @override
  State<PopupKatalog> createState() => _PopupKatalogState();
}

class _PopupKatalogState extends State<PopupKatalog> {
  @override
  Widget build(BuildContext context) {
    PopupController popupC = Get.put(PopupController());
    return Dialog(
      child: Container(
        margin: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
        decoration: BoxDecoration(color: Colors.white),
        height: 450,
        width: 200,
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: ListView(
            children: <Widget>[
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
              Expanded(
                child: Text(
                  '${popupC.detail?.data?.judulBuku!}',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(right: 30, left: 30, bottom: 30),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  child: Image(
                    image: NetworkImage(
                      'https://perpustakaan.kemenkeu.go.id/img/FileCover/${popupC.detail?.data?.fileCover}',
                    ),
                    fit: BoxFit.fill,
                  ),
                ),

                // width: 50,
                // height: 200,
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                  popupC.detail?.data?.abstrak != null
                      ? '${popupC.detail?.data?.abstrak}'
                      : '',
                  style: TextStyle(),
                  textAlign: TextAlign.justify),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Expanded(
                    child: Text('Penulis'),
                    flex: 3,
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Text(':'),
                  Expanded(
                    child: Text(popupC.detail?.data?.namaPengarang != null
                        ? '${popupC.detail?.data?.namaPengarang}'
                        : ''),
                    flex: 4,
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Expanded(
                    child: Text('Penerbit'),
                    flex: 3,
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Text(':'),
                  Expanded(
                    child: Text('${popupC.detail?.data?.namaPenerbit}'),
                    flex: 4,
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Expanded(
                    child: Text('ISBN'),
                    flex: 3,
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Text(':'),
                  Expanded(
                    child: Text('${popupC.detail?.data?.isbn}'),
                    flex: 4,
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Expanded(
                    child: Text('Lokasi Rak'),
                    flex: 3,
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Text(':'),
                  Expanded(
                    child: Text(popupC.detail?.data?.lokasiRak != null
                        ? '${popupC.detail?.data?.lokasiRak}'
                        : ''),
                    flex: 4,
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Expanded(
                    child: Text('Lokasi Perpustakaan'),
                    flex: 3,
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Text(':'),
                  Expanded(
                    child: Text('${popupC.detail?.data?.lokasi}'),
                    flex: 4,
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Expanded(
                    child: Text('Subyek'),
                    flex: 3,
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Text(':'),
                  Expanded(
                    child: Text(popupC.detail?.data?.subyek != null
                        ? '${popupC.detail?.data?.subyek}'
                        : ''),
                    flex: 4,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
