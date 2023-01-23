import 'package:flutter/material.dart';
import 'package:adv_disenios/src/pages/pages.dart';

void main() => runApp(const DiseniosApp());

class DiseniosApp extends StatelessWidget {
  const DiseniosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños Adv',
      home: PinterestPage(),
    );
  }
}