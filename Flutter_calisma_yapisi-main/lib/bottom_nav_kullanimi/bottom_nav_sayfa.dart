import 'package:calisma_yapisi/bottom_nav_kullanimi/sayfa_bir.dart';
import 'package:calisma_yapisi/bottom_nav_kullanimi/sayfa_iki.dart';
import 'package:calisma_yapisi/bottom_nav_kullanimi/sayfa_uc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BottomNavSayfa extends StatefulWidget {
  const BottomNavSayfa({super.key});

  @override
  State<BottomNavSayfa> createState() => _BottomNavSayfaState();
}

class _BottomNavSayfaState extends State<BottomNavSayfa> {
  int secilenIndeks = 2;
  var sayfalar = [const SayfaBir(),const SayfaIki(),const SayfaUc()];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bottom Navigation"),backgroundColor: Colors.purple,),
      body:  sayfalar [secilenIndeks],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.looks_one_outlined),label:"Bir"),
          BottomNavigationBarItem(icon: Icon(Icons.looks_two_outlined),label:"İki"),
          BottomNavigationBarItem(icon: Icon(Icons.looks_3_outlined),label:"Uc"),
        ],
        currentIndex: secilenIndeks,
        backgroundColor: Colors.deepPurple,
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.white24,
        onTap: (indeks){
          setState(() {
            secilenIndeks=indeks;
          });
        },
      ),
    );
  }
}
