import 'dart:math';

class MesajlarRepository{

  final List<Mesaj> mesajlar=[
    Mesaj("merhaba", "ali", DateTime.now().subtract(const Duration(minutes: 1),),),
    Mesaj("nasılsın", "ayşe", DateTime.now(),),
    Mesaj("iyiyim", "fatma", DateTime.now().subtract(const Duration(minutes: 1),),),
  ];
  int yenimesajsayisi=4;

}
class Mesaj{
  String yazi;
  String gonderen;
  DateTime zaman;

  Mesaj(this.yazi, this.gonderen, this.zaman);
}