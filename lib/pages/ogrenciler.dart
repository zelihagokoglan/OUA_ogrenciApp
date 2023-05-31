import 'dart:js_util';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ogrenci_app_oyunveuygulamakademi/repository/ogrenciler_repository.dart';

class OgrencilerSayfasi extends StatefulWidget {
  final OgrencilerRepository ogrencilerRepository;
  const OgrencilerSayfasi(this.ogrencilerRepository,{Key? key}) : super(key: key);

  @override
  State<OgrencilerSayfasi> createState() => _OgrencilerSayfasiState();
}

class _OgrencilerSayfasiState extends State<OgrencilerSayfasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Öğrenciler"),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          PhysicalModel(
            color: Colors.white,
              elevation: 10,
              child: Center(child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8.0),
                child: Text("${widget.ogrencilerRepository.ogrenciler.length} öğrenci"
                ),
              ),
              ),
          ),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context,index)=>  OgrenciSatiri(),
                separatorBuilder: (context,index)=> const Divider(),
                itemCount: widget.ogrencilerRepository.ogrenciler.length,
            ),
          ),
        ],
      ),
    );
  }
}


class OgrenciSatiri extends StatefulWidget {
  final Ogrenci ogrenci;
  final OgrencilerRepository ogrencilerRepository;


  const OgrenciSatiri(this.ogrenci,this.ogrencilerRepository, {
    Key? key,
}): super (key: key);

  @override
  State<OgrenciSatiri> createState() => _OgrenciSatiriState();
}

class _OgrenciSatiriState extends State<OgrenciSatiri> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.ogrenci.adi+""+widget.ogrenci.soyadi),
      leading: IntrinsicWidth(child: Center(child: Text(widget.ogrenci.cinsiyet=="kadın"? "KK": "EE"))),
      trailing: IconButton(
        onPressed: (){
          widget.ogrencilerRepository.sev(widget.ogrenci);
        },
        icon:  (Icon(widget.ogrencilerRepository.seviyorMuyum(widget.ogrenci)? Icons.favorite:Icons.favorite_border,color: Colors.red,)),
      ),
    );
  }
}

