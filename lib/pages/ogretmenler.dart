import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ogrenci_app_oyunveuygulamakademi/repository/ogretmenler_repository.dart';

class OgretmenlerSayfasi extends StatefulWidget {
  final OgretmenlerRepository ogretmenlerRepository;
  const OgretmenlerSayfasi(this.ogretmenlerRepository, {Key? key}) : super(key: key);

  @override
  State<OgretmenlerSayfasi> createState() => _OgretmenlerSayfasiState();
}

class _OgretmenlerSayfasiState extends State<OgretmenlerSayfasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Öğretmenler"),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 12.0),
            child: Center(
                child: Container(
                  height: 20,
                  width: 200,
                  child: const PhysicalModel(
                      color: Colors.white,
                      elevation: 10,
                      child: Center(child: const Text("25 Öğretmen"))),
                )),
          ),
          Expanded(
            child:
            ListView.separated(
              itemBuilder: (context,index)=>  ListTile(
                leading: Icon(Icons.man_outlined),
                title: Text("Ali"),
              ),
              separatorBuilder: (context, index)=> const Divider(),
              itemCount: 25,
            ),
          ),
        ],
      ),
    );
  }
}
