import 'package:flutter/material.dart';
import 'package:flutter_app/Pertemuan-6/models/color.dart';

var cardstyle = ButtonStyle(
  backgroundColor: WidgetStatePropertyAll(Colors.transparent),
  shadowColor: WidgetStatePropertyAll(Colors.transparent),
  shape: WidgetStatePropertyAll(RoundedRectangleBorder()),
  padding: WidgetStatePropertyAll(EdgeInsetsGeometry.all(0)),
);

var buttonstyle = ButtonStyle(
  shape: WidgetStatePropertyAll(
    RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  ),
  fixedSize: WidgetStatePropertyAll(Size(double.infinity, 46)),
);

var closebutton = ButtonStyle(
  backgroundColor: WidgetStatePropertyAll(lightgrey),
  minimumSize: WidgetStatePropertyAll(Size.zero),
);

var titlestyle = TextStyle(fontSize: 24, fontWeight: FontWeight.w700);

var contentstyle = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w400,
  color: darkgrey,
);
