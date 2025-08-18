import 'package:flutter/material.dart';

// theme button

ButtonStyle button = ButtonStyle(
  backgroundColor: WidgetStatePropertyAll(Colors.blue),
  padding: WidgetStatePropertyAll(EdgeInsets.all(12)),
  elevation: WidgetStatePropertyAll(4),
  shape: WidgetStatePropertyAll(
    RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(8)),
  ),
);

// header 1 text e.g. title

Text h1(double size, String teks) {
  return Text(
    style: TextStyle(
      fontSize: size,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    teks,
  );
}

// header 2 text e.g. sub title

Text h2(String teks) {
  return Text(
    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    teks,
  );
}

// regular text

Text text(String teks) {
  return Text(style: TextStyle(fontSize: 18), teks);
}
