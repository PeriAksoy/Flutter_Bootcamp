class Filmler{
  int id;
  String adi;
  String resim;
  int fiyat;

  Filmler({required this.id, required this.adi, required this.resim, required this.fiyat});

  factory Filmler.fromJson(Map<Filmler,dynamic>json){
    return Filmler(
        id: json["id"] as int ,
        adi: json["ad"] as String ,
        resim: json["resim"] as String ,
        fiyat: json["fiyat"] as int );
  }
}