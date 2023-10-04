import 'package:flutter/material.dart';
import 'package:lat3/halaman_utama.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kuis Mobile',
      theme: ThemeData(),
      home: const HalamanUtama(),
      debugShowCheckedModeBanner: false,
    );
  }
}

