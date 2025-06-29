import 'package:flutter/material.dart';

class KullaniciEtkilesimiSayfa extends StatefulWidget{
  const KullaniciEtkilesimiSayfa({super.key});

  @override
  State<KullaniciEtkilesimiSayfa> createState() => _KullaniciEtkilesimiSayfaState();
}

class _KullaniciEtkilesimiSayfaState extends State<KullaniciEtkilesimiSayfa> {
  var tfControl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kullanici Etkilesimi"),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(onPressed: (){
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: const Text("Silmek istiyor musunuz?"),
                    action: SnackBarAction(label: "Evet", onPressed: (){
                     ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: const Text("Silindi"),));
                    }),
                ),
              );

            }, child: const Text("Snackbar")),
            ElevatedButton(onPressed: (){
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text("Silmek istiyor musunuz?",style: TextStyle(color:Colors.purple),),
                  backgroundColor: Colors.white,
                  action: SnackBarAction(label: "Evet",textColor: Colors.amberAccent, onPressed: (){
                    ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: const Text("Silindi",style: TextStyle(color:Colors.deepPurple),),backgroundColor: Colors.white,));
                  }),
                ),
              );

            }, child: const Text("Snackbar (Özel)")),
            ElevatedButton(onPressed: (){
              showDialog(
                  context: context,
                  builder:(BuildContext context){
                    return AlertDialog(
                      title: const Text("Kayit islemi"),
                      content: const Text("İçerik"),
                      actions: [
                        TextButton(onPressed: (){
                          print("İptal secildi");
                          Navigator.pop(context);

                        }, child: Text("İptal")),
                        TextButton(onPressed: (){
                          print("Tamam secildi");
                          Navigator.pop(context);

                        }, child: Text("Tamam")),
                      ],
                    );
                  });

            }, child: const Text("Alert")),
            ElevatedButton(onPressed: (){
              showDialog(
                  context: context,
                  builder:(BuildContext context){
                    return AlertDialog(
                      title: const Text("Baslik"),
                      content: TextField(controller: tfControl,decoration: InputDecoration(hintText: "Veri"),),
                      backgroundColor: Colors.grey,
                      actions: [
                        TextButton(onPressed: (){
                          print("İptal secildi");
                          Navigator.pop(context);

                        }, child: const Text("İptal",style: TextStyle(color: Colors.brown),)),
                        TextButton(onPressed: (){
                          print("Alınan veri : ${tfControl.text}");
                          Navigator.pop(context);
                          tfControl.text="";//İçerik temizlendi
                        }, child: Text("Kaydet",style: TextStyle(color:Colors.black),)),
                      ],
                    );
                  });
            }, child: const Text("Alert(Özel)")),
          ],
        ),
      ),
    );
  }
}
