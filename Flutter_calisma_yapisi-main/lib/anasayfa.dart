import 'package:calisma_yapisi/kisiler.dart';
import 'package:calisma_yapisi/oyun_ekrani.dart';
import 'package:flutter/material.dart';
class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  int sayac =0;
  bool kontrol = false;
  @override
  void initState() {
    super.initState();
    print("initState() çalıştı");
  }
  Future<int> toplama(int sayi1,int sayi2) async{
    int toplam = sayi1+sayi2;
    return toplam;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: const Text("Anasayfa"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Sonuc : $sayac"),
        ElevatedButton(
          onPressed: () {
            setState(() {
              sayac++;
            });
          },
          child: const Text("Tıkla"),
        ),

        ElevatedButton(
          onPressed: () {
            var kisi = Kisiler(ad: "Nisa", yas: 20, boy: 1.68, bekar: true);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OyunEkrani(kisi: kisi),
              ),
            );
          },
          child: const Text("Başla"),
        ),
            Visibility(visible: kontrol,child: Text("Merhaba")),
            Text(kontrol ? "Merhaba" : "Güle güle ",style: TextStyle(color: kontrol
            ? Colors.blue : Colors.red),),
            Text("Merhaba"),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  kontrol = true;
                });
              },
              child: const Text("Durum 1 (true)"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                kontrol = false;
                });
              },
              child: const Text("Durum 1 (false)"),
            ),
            FutureBuilder<int>(
              future: toplama(4, 5),
              builder: (context,snapshot){
                if(snapshot.hasError){
                  return const Text("Hata olustu");
                }
                if(snapshot.hasData){
                  return  Text("Sonuc: ${snapshot.data}");
                }else{
                  return const Text("Hata olustu");
                }
              },
            ),
        ],
      ),
      ),
    );
  }
}
