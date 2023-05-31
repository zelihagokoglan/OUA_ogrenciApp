class OgrencilerRepository{
  final List<Ogrenci> ogrenciler= [
    Ogrenci("ali", "çelik", 19, "erkek"),
    Ogrenci("ayşe", "kaplan", 20, "kadın"),
    Ogrenci("ender", "yılmaz", 18, "erkek"),
    Ogrenci("fatma", "yılmaz", 21, "kadın"),


  ];
final Set<Ogrenci> sevdiklerim={};
  void sev(Ogrenci ogrenci) {
    sevdiklerim.add(ogrenci);
  }

  bool seviyorMuyum(Ogrenci ogrenci) {
    return sevdiklerim.contains(ogrenci);
  }

}

class Ogrenci{
  String adi;
  String soyadi;
  int yas;
  String cinsiyet;

  Ogrenci(this.adi, this.soyadi, this.yas, this.cinsiyet);
}