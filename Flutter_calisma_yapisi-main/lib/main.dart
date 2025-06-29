import 'package:calisma_yapisi/bottom_nav_kullanimi/bottom_nav_sayfa.dart';
import 'package:calisma_yapisi/kullanici_etkilesimi/kullanici_etkilesimi_sayfa.dart';
import 'package:flutter/material.dart';

import 'anasayfa.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const KullaniciEtkilesimiSayfa()
    );
  }
}

