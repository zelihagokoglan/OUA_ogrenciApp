import 'package:flutter/material.dart';
import 'package:ogrenci_app_oyunveuygulamakademi/pages/mesajlar.dart';
import 'package:ogrenci_app_oyunveuygulamakademi/pages/ogrenciler.dart';
import 'package:ogrenci_app_oyunveuygulamakademi/pages/ogretmenler.dart';
import 'package:ogrenci_app_oyunveuygulamakademi/repository/mesajlar_repository.dart';
import 'package:ogrenci_app_oyunveuygulamakademi/repository/ogrenciler_repository.dart';
import 'package:ogrenci_app_oyunveuygulamakademi/repository/ogretmenler_repository.dart';


void main() {
  runApp(const OgrenciApp());
}

class OgrenciApp extends StatelessWidget {
  const OgrenciApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home:  Anasayfa(title:"Öğrenci Uygulaası"),
    );
  }
}

class Anasayfa extends StatefulWidget {
  const Anasayfa({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}
class _AnasayfaState extends State<Anasayfa>{
  OgretmenlerRepository ogretmenlerRepository=OgretmenlerRepository();
  OgrencilerRepository ogrencilerRepository= OgrencilerRepository();
  MesajlarRepository mesajlarRepository= MesajlarRepository();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Öğrenci Anasayfa"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
              onPressed: () {
                _mesajlaraGit(context);
              },
              child: Text("${mesajlarRepository.yenimesajsayisi} yeni mesaj"),
            ),
            TextButton(
              onPressed: () {
                _ogrencilereGit(context);
              },
              child: Text("${ogrencilerRepository.ogrenciler.length} öğrenci"),
            ),
            TextButton(
              onPressed: () {
                _ogretmenlereGit(context);
              },
              child: Text("${ogretmenlerRepository.ogretmenler.length} öğretmen"),
            ),
          ],
        ),
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text("Öğrenci Adı",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              decoration: BoxDecoration(
                  color: Colors.orange
              ),
            ),
            ListTile(
              title: Text("Öğrenciler",
                style: TextStyle(fontSize: 16, color: Colors.black),),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> OgrencilerSayfasi(ogrencilerRepository),),);
              },
            ),
            ListTile(
              title: Text("Öğretmenler",
                style: TextStyle(fontSize: 16, color: Colors.black),),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> OgretmenlerSayfasi(ogretmenlerRepository),),);
              },
            ),
            ListTile(
              title: Text("Mesajlar",
                style: TextStyle(fontSize: 16, color: Colors.black),),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> MesajlarSayfasi(mesajlarRepository),),);
              },
            ),
          ],
        ),
      ),
    );
  }
  Future<void> _mesajlaraGit (BuildContext context)async{
   await Navigator.of(context).push(MaterialPageRoute(builder: (context){
      return MesajlarSayfasi(mesajlarRepository);
    },));
   setState(() {

   });
  }
  void _ogrencilereGit (BuildContext context){
    Navigator.of(context).push(MaterialPageRoute(builder: (context){
      return OgrencilerSayfasi(ogrencilerRepository);
    },));
  }
  void _ogretmenlereGit (BuildContext context){
    Navigator.of(context).push(MaterialPageRoute(builder: (context){
      return OgretmenlerSayfasi(ogretmenlerRepository);
      },));
  }
}
