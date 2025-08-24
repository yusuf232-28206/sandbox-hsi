import 'package:flutter/material.dart';
import 'package:flutter_app/Pertemuan-6/models/color.dart';
import 'package:flutter_app/Pertemuan-6/views/home/home.dart';

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Not App',
      theme: themecolor(),
      debugShowMaterialGrid: false,
      home: Home(),
    );
  }
}
