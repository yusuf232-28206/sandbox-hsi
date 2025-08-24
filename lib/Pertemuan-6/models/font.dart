import 'package:flutter/material.dart';
import 'package:flutter_app/Pertemuan-6/models/color.dart';

Text header1(
  String teks, {
  Color? color = Colors.black,
  TextAlign? align = TextAlign.center,
}) {
  return Text(
    textAlign: align,
    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: color),
    teks,
  );
}

Text header2(Color? color, String teks) {
  return Text(
    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: color),
    teks,
  );
}

Text regular(String teks, {TextAlign align = TextAlign.start}) {
  return Text(
    style: TextStyle(
      fontSize: 14,
      color: darkgrey,
      fontWeight: FontWeight.w400,
    ),
    textAlign: align,
    teks,
  );
}

Text buttontext(String teks) {
  return Text(
    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
    teks,
  );
}

Text cardtitle(String teks) {
  return Text(
    textAlign: TextAlign.left,
    style: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
    teks,
  );
}

Text cardcontent(String teks) {
  return Text(
    style: TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      color: Colors.black.withValues(alpha: 0.6),
      overflow: TextOverflow.ellipsis,
    ),
    maxLines: 7,
    teks,
  );
}
