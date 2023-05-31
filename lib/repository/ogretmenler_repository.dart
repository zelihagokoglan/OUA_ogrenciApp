class OgretmenlerRepository{
  final List<Ogretmen>  ogretmenler= [
    Ogretmen("merve", "kaplan", 34, "kadın", "türkçe"),
    Ogretmen("ahmet", "can", 29, "erkek", "fizik"),
    Ogretmen("derya", "çelik", 54, "kadın", "matematik"),

  ];
}

class Ogretmen{
  String? adi;
  String? soyadi;
  int? yas;
  String? cinsiyet;
  String? brans;

  Ogretmen(this.adi, this.soyadi, this.yas, this.cinsiyet, this.brans);
}