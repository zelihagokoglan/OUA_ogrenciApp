import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ogrenci_app_oyunveuygulamakademi/repository/mesajlar_repository.dart';

class MesajlarSayfasi extends StatefulWidget {
  final MesajlarRepository mesajlarRepository;
  const MesajlarSayfasi(this.mesajlarRepository, {Key? key}) : super(key: key);

  @override
  State<MesajlarSayfasi> createState() => _MesajlarSayfasiState();
}

class _MesajlarSayfasiState extends State<MesajlarSayfasi> {
  @override
  void initState() {
   widget.mesajlarRepository.yenimesajsayisi=0;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Mesajlar"),
      ),
      body: Column(
        children:[
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    reverse: true,
                      itemCount:widget.mesajlarRepository.mesajlar.length ,
                      itemBuilder: (context,index){
                        return MesajGorunumu(widget.mesajlarRepository.mesajlar[index]);},
                  ),
                ),
              ],
            ),
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            child: Row(
              children: [
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius:const BorderRadius.all(Radius.circular(20.0),),
                        ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: const TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none
                              ),
                            ),
                          ),

                      ),
                    )
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(8.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: ElevatedButton(
                      onPressed: (){
                        print("Gönder");
                      },
                        child: Text("Gönder"),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class MesajGorunumu extends StatelessWidget {
  final Mesaj mesaj;
  const MesajGorunumu(this.mesaj, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: mesaj.gonderen == "ali" ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 2),
            color: Colors.orange.shade100,
            borderRadius: BorderRadius.all(Radius.circular(10)
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(mesaj.yazi),
          ),
        ),
      ),
    );
  }
}

