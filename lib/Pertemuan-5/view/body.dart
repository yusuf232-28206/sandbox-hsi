import 'package:flutter/material.dart';
import 'package:flutter_app/Pertemuan-5/model/model.dart';

Scaffold scaff(Widget? body) {
  return Scaffold(
    backgroundColor: Colors.blue,
    extendBodyBehindAppBar: true,
    appBar: AppBar(forceMaterialTransparency: true),

    body: body,
  );
}

var header = Container(
  alignment: Alignment.bottomLeft,
  color: Colors.blue,
  padding: EdgeInsets.only(left: 24, bottom: 24),
  width: 240,
  height: 240,
  child: h1(40, 'Data Siswa Kelas XI'),
);

Container datasiswa(int count, itembuilder) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      color: Colors.white,
    ),
    padding: EdgeInsets.only(left: 24, right: 8),
    child: ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 8),
      scrollDirection: Axis.vertical,
      itemCount: count,
      itemBuilder: itembuilder,
    ),
  );
}
