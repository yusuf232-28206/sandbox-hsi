import 'package:flutter/material.dart';
import 'package:flutter_app/Pertemuan-6/models/color.dart';
import 'package:flutter_app/Pertemuan-6/models/style.dart';

Container card(Widget child) {
  return Container(
    padding: EdgeInsets.all(16),
    height: 166,
    width: 150,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: Colors.black12),
    ),
    child: child,
  );
}

FilledButton cardnote(void Function()? onPressed, Widget child) {
  return FilledButton(style: cardstyle, onPressed: onPressed, child: child);
}

Dialog dialog(
  List<Widget> child, {
  MainAxisAlignment align = MainAxisAlignment.center,
}) {
  return Dialog(
    insetAnimationDuration: Durations.medium2,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadiusGeometry.circular(8),
    ),

    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        height: 160,
        child: Column(mainAxisAlignment: align, spacing: 16, children: child),
      ),
    ),
  );
}

FloatingActionButton floatingbutton(void Function()? onPressed) {
  return FloatingActionButton(
    backgroundColor: primary,
    shape: CircleBorder(),
    onPressed: onPressed,
    child: Icon(color: Colors.white, Icons.add),
  );
}

AppBar back(onPressed) {
  return AppBar(
    leading: BackButton(onPressed: onPressed),
    titleSpacing: 0,
    title: Text(
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      'Back',
    ),
    shape: Border(bottom: BorderSide(width: 0.1)),
    toolbarHeight: 54,
  );
}

BottomAppBar bottom(Widget child) {
  return BottomAppBar(
    height: 48,
    padding: EdgeInsets.all(0),
    color: Colors.white,
    child: Container(
      padding: EdgeInsets.only(left: 8),
      decoration: BoxDecoration(border: Border(top: BorderSide(width: 0.1))),
      child: child,
    ),
  );
}
