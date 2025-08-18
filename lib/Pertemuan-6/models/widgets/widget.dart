import 'package:flutter/material.dart';
import 'package:flutter_app/Pertemuan-6/controllers/controller.dart';
import 'package:flutter_app/Pertemuan-6/models/color.dart';
import 'package:flutter_app/Pertemuan-6/models/style.dart';
import 'package:flutter_app/Pertemuan-6/services/database.dart';
import 'package:flutter_app/Pertemuan-6/views/menus/notes.dart';

Container card(Widget child) {
  return Container(
    padding: EdgeInsets.all(16),
    height: 174,
    width: 158,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: Colors.black12),
    ),
    child: child,
  );
}

FilledButton cardnote(
  BuildContext context,
  List<Notes> notes,
  Notes notevalue,
  Widget child,
) {
  return FilledButton(
    style: cardstyle,
    onPressed: () async {
      router(context, Note(notevalue: notevalue));
    },
    child: child,
  );
}

FloatingActionButton floatingbutton(
  BuildContext context,
  void Function()? onPressed,
) {
  return FloatingActionButton(
    backgroundColor: primary,
    shape: CircleBorder(),
    onPressed: onPressed,
    child: Icon(color: Colors.white, Icons.add),
  );
}

AppBar back(BuildContext context) {
  return AppBar(
    leading: BackButton(onPressed: () => Navigator.pop(context, 're')),
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
