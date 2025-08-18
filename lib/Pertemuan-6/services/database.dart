import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_app/Pertemuan-6/main.dart';
import 'package:sqflite/sqflite.dart';

loginAccount(String email, String password) async {
  final c = await db.query(
    'akun',
    where: 'email = ? AND password = ?',
    whereArgs: [email, password],
  );
  return c.isEmpty;
}

getAccount(String name, String email) async {
  return await Future.delayed(Durations.extralong1, () async {
    final c = await db.query(
      'akun',
      where: 'name = ? OR email = ?',
      whereArgs: [name, email],
    );
    return c.isNotEmpty;
  });
}

insertAccount(String name, String email, String password) async {
  Map<String, Object?> useraccount = {
    'name': name,
    'email': email,
    'password': password,
  };

  await db
      .insert('akun', useraccount)
      .then((value) => log('sukses?$value'))
      .catchError((error) => log('error?$error'));
}

Future<List<Notes>> getNotes() async {
  late List<Map<String, Object?>> maps;

  await Future.delayed(Duration(seconds: 1), () async {
    maps = await db.query('notes');
    return CircularProgressIndicator();
  });

  return List.generate(maps.length, (i) {
    return Notes.fromMap(maps[i]);
  });
}

Future<void> insertNote(Notes note) async {
  await db.insert(
    'notes',
    note.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Future<void> updateNote(Notes note) async {
  await db.update('notes', note.toMap(), where: 'id = ?', whereArgs: [note.id]);
}

Future<void> deleteNote(int id) async {
  await db.delete('notes', where: 'id = ?', whereArgs: [id]);
}

class Notes {
  final int? id;
  final String title;
  final String content;

  Notes({this.id, required this.title, required this.content});

  // Konversi ke Map untuk disimpan di database
  Map<String, dynamic> toMap() {
    return {'id': id, 'title': title, 'content': content};
  }

  // Membuat objek Notes dari Map yang diambil dari database
  factory Notes.fromMap(Map<String, dynamic> map) {
    return Notes(id: map['id'], title: map['title'], content: map['content']);
  }
}
