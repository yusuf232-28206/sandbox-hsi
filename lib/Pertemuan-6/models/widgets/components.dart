import 'package:flutter/material.dart';
import 'package:flutter_app/Pertemuan-6/models/color.dart';
import 'package:flutter_app/Pertemuan-6/models/font.dart';
import 'package:flutter_app/Pertemuan-6/models/style.dart';

FilledButton button(String teks, void Function()? onPressed) {
  return FilledButton(
    style: buttonstyle,
    onPressed: onPressed,
    child: buttontext(teks),
  );
}

ListTile tiles(IconData icon, Widget teks, Color color, void Function()? tap) {
  return ListTile(
    contentPadding: EdgeInsets.symmetric(horizontal: 0),
    iconColor: color,
    textColor: color,
    leading: Icon(size: 24, icon),
    title: teks,
    onTap: tap,
  );
}

IconButton close(void Function()? onPressed) {
  return IconButton.filled(
    style: closebutton,
    onPressed: onPressed,
    icon: Icon(size: 14, color: darkgrey, Icons.close),
  );
}
