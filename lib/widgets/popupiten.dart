import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getxkatalog/models/katalog_model.dart';

class PopUpIten extends StatelessWidget {
  final IsiKatalog data;

  const PopUpIten({super.key, required this.data});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: ListView(
          children: [
            ListTile(
              title: Text(data.judulBuku!),
            ),
            Image(
              image: NetworkImage(
                'https://perpustakaan.kemenkeu.go.id/img/FileCover/${data.fileCover}',
              ),
            )
          ],
        ),
      ),
    );
  }
}
