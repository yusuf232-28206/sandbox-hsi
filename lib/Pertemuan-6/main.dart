import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_app/Pertemuan-6/controllers/bloc/page_bloc.dart';
import 'package:flutter_app/Pertemuan-6/models/app/app.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

late Database db;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // aktifkan apabila
  // dijalankan di desktop
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

  runApp(BlocProvider(create: (_) => PageBloc(), child: Main()));
}
