
import 'package:filmler_uygulamasi/data/entity/filmler.dart';
import 'package:filmler_uygulamasi/ui/cubit/anasayfa_cubit.dart';
import 'package:filmler_uygulamasi/ui/views/detay_sayfa.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({super.key});

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  @override
  void initState() {
    super.initState();
    context.read<AnasayfaCubit>().filmleriYukle();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filmler"),
      ),
      body: BlocBuilder<AnasayfaCubit,List<Filmler>>(
        builder: (context,filmlerListesi){
          if(filmlerListesi.isNotEmpty){
            return GridView.builder(
              itemCount: filmlerListesi.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:2,childAspectRatio: 1 / 1.8
              ),
              itemBuilder: (context,indeks){
                var film = filmlerListesi[indeks];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> DetaySayfa(film: film)));
                  },
                  child: Card(
                    child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.network("http://kasimadalan.pe.hu/filmler_yeni/resimler/${film.resim}"),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("${film.fiyat} tl",style: TextStyle(fontSize: 24),),
                            ElevatedButton(onPressed: (){
                              print("${film.adi} sepete eklendi");
                            }, child: const Text("Sepet"))
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            );

          }else{
            return const Center(

            );
          }
        },
      ),
    );
  }
}
