import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_app/Pertemuan-6/controllers/controller.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/Pertemuan-6/models/color.dart';
import 'package:flutter_app/Pertemuan-6/views/home/home.dart';
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

late Database db;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // aktifkan jika dijalankan di desktop
  //
  // databaseFactory = databaseFactoryFfi;

  final path = await getDatabasesPath();
  log(path);
  final dbPath = join(path, 'notes.db');
  log(dbPath);
  db = await openDatabase(dbPath);

  await db.execute('''
      CREATE TABLE IF NOT EXISTS notes (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        content TEXT NOT NULL
      )
      ''');

  await db.execute('''
      CREATE TABLE IF NOT EXISTS akun (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        email TEXT NOT NULL,
        password TEXT NOT NULL
      )
      ''');

  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => X())],
      child: Mains(),
    ),
  );
}

class Mains extends StatelessWidget {
  const Mains({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themecolor(),
      debugShowMaterialGrid: false,
      home: Home(page: homepage()),
    );
  }
}
