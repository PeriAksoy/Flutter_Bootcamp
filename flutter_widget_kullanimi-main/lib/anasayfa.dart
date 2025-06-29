import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  var tfController = TextEditingController();
  String alinanVeri = "";
  String resimAdi = "baklava.png";
  bool switchKontrol = false;
  bool checkBoxKontrol = false;
  int radioDeger =0;
  bool progressKontrol = false;
  double ilerleme = 30.0;
  var tfSaat = TextEditingController();
  var tfTarih = TextEditingController();
  var ulkelerListesi = <String>[];
  String secilenUlke = "Türkiye";
  @override
  void initState() {
    ulkelerListesi.add("Türkiye");
    ulkelerListesi.add("İtalya");
    ulkelerListesi.add("Japonya");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Widgets"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Text(alinanVeri),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller:tfController,
                  decoration: InputDecoration(hintText: "Veri"),
                  keyboardType: TextInputType.number,
                  obscureText: true,
                ),
              ),
              ElevatedButton(onPressed: (){
                setState(() {
                  alinanVeri = tfController.text;
                });
              }, child: const Text("Veriyi Al")),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: (){
                    setState(() {
                       resimAdi="kofte.png";
                    });
                  }, child: const Text("Resim 1" )),
                  SizedBox(width: 48,height: 48,
                      child: Image.network("http://kasimadalan.pe.hu/yemekler/resimler/$resimAdi")),
                  ElevatedButton(onPressed: (){
                    setState(() {
                      resimAdi="ayran.png";
                    });
                  }, child: const Text("Resim 2"))
                ],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(width: 200,
                  child: SwitchListTile(
                    title: const Text("Dart"),
                      controlAffinity: ListTileControlAffinity.leading,
                      value: switchKontrol,
                      onChanged:(veri){
                      setState(() {
                      switchKontrol = veri;
                    });
                  }),
                ),
                SizedBox(width: 200,
                  child: CheckboxListTile(
                      title: const Text("Flutter"),
                      controlAffinity: ListTileControlAffinity.leading,
                      value: checkBoxKontrol,
                      onChanged:(veri){
                        setState(() {
                          checkBoxKontrol = veri!;
                        });
                      }),
                )
              ],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(width: 200,
                    child: RadioListTile(
                        title: const Text("Barcelona"),
                        controlAffinity: ListTileControlAffinity.leading,
                        value: 1,
                        groupValue: radioDeger,
                        onChanged:(veri){
                          setState(() {
                          radioDeger=veri!;
                          });
                        }),
                  ),
                  SizedBox(width: 200,
                    child: RadioListTile(
                        title: const Text("Real Madrid"),
                        controlAffinity: ListTileControlAffinity.leading,
                        value: 2,
                        groupValue: radioDeger,
                        onChanged:(veri){
                          setState(() {
                            radioDeger = veri!;
                          });
                        }),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: (){
                    setState(() {
                      progressKontrol = true;
                    });
                  }, child: const Text("Basla" )),
                  Visibility(visible: progressKontrol,child: const CircularProgressIndicator()),
                  ElevatedButton(onPressed: (){
                    setState(() {
                     progressKontrol = false;
                    });
                  }, child: const Text("Dur"))
                ],
              ),
              Text(ilerleme.toInt().toString()),
              Slider(max:100.0 ,min:0.0 ,value: ilerleme, onChanged: (veri){
                setState(() {
                  ilerleme = veri;
                });
              }),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(width:120,
                      child: TextField(controller:tfSaat, decoration: InputDecoration(hintText: "Saat"))),
                  IconButton(onPressed: (){
                    showTimePicker(context: context, initialTime: TimeOfDay.fromDateTime(DateTime.now()))
                        .then((value) {
                       tfSaat.text="${value!.hour} : ${value!.minute}";
                    });
                  }, icon:const Icon(Icons.access_time)),
                  SizedBox(width:120,
                      child: TextField(controller:tfTarih, decoration: InputDecoration(hintText: "Tarih"))),
                  IconButton(onPressed: (){
                    showDatePicker(context: context, firstDate: DateTime(2000), lastDate: DateTime(2025)).then((value) {
                      tfTarih.text="${value!.day} /${value.month} / ${value.year}";
                    });
                  }, icon:const Icon(Icons.date_range)),
                ],
              ),
              DropdownButton(
                value: secilenUlke,
                  icon: const Icon(Icons.arrow_drop_down),
                  items: ulkelerListesi.map((ulke) {
                    return DropdownMenuItem(value: ulke,
                    child: Text(ulke),);
                  }).toList(),
                  onChanged: (veri) {
                    setState(() {
                      secilenUlke = veri!;
                    });
                  }),
              GestureDetector(
                onTap: (){
                  print("Container tek tıklandı");
                },
                onDoubleTap: (){
                print("Contaioner çift tıklandi");
                },
                onLongPress: (){
                print("Container üzerine uzun basildi");
                },
                  child: Container(width: 200,height: 50,color: Colors.red,)),
              ElevatedButton(onPressed: (){
                print("Switch durum : $switchKontrol");
                print("Checkbox durum :$checkBoxKontrol");
                print("Radio durum : $radioDeger");
                print("Slider durun : $ilerleme");
                print("Secilen ulke durum :$secilenUlke");
              }, child: const Text("Göster")),
            ],
          ),
        ),
      ),
    );
  }
}
