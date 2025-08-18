import 'package:flutter/material.dart';
import 'package:flutter_app/Pertemuan-5/controller/validator.dart';
import 'package:flutter_app/Pertemuan-5/model/model.dart';

// tombol konfirmasi tambah

FilledButton formAdd(Function()? onPressed) {
  return FilledButton(style: button, onPressed: onPressed, child: Text('Add'));
}

// tombol konfirmasi edit

FilledButton formEdit(Function(dynamic) onPressed, dynamic index) {
  return FilledButton(
    style: button,
    onPressed: () => onPressed(index),
    child: Text('Edit'),
  );
}

// kolom input nama siswa

TextFormField formFields(Function(String) onChanged, String hint) {
  return TextFormField(
    autofocus: true,
    decoration: InputDecoration(border: OutlineInputBorder(), hintText: hint),
    onChanged: onChanged,
    validator: validator,
  );
}

// tombol untuk menambahkan siswa

Container addButton(Function()? onPressed) {
  return Container(
    color: Colors.white,
    padding: EdgeInsets.fromLTRB(16, 8, 16, 24),
    width: double.maxFinite,
    child: FilledButton.icon(
      style: button,
      icon: Icon(size: 24, Icons.add),
      label: h1(20, 'Tambah Siswa'),
      onPressed: onPressed,
    ),
  );
}

// tombol untuk mengedit data siswa

IconButton editButton(Function()? onPressed) {
  return IconButton(
    onPressed: onPressed,
    tooltip: 'Edit',
    icon: Icon(Icons.edit_rounded),
  );
}

// tombol untuk menghapus data siswa

IconButton deleteButton(Function()? onPressed) {
  return IconButton(
    tooltip: 'Hapus',
    onPressed: onPressed,

    icon: Icon(Icons.delete),
  );
}
