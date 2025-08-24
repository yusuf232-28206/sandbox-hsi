import 'package:flutter/material.dart';
import 'package:flutter_app/Pertemuan-6/controllers/controller.dart';
import 'package:flutter_app/Pertemuan-6/models/color.dart';
import 'package:flutter_app/Pertemuan-6/models/font.dart';
import 'package:flutter_app/Pertemuan-6/models/style.dart';

Form form(
  Key? key,
  TextEditingController controller,
  Widget teks, {
  bool view = false,
  Widget? inkwell,
}) {
  return Form(
    key: key,
    child: TextFormField(
      controller: controller,
      obscureText: view,
      decoration: InputDecoration(
        hint: teks,
        border: OutlineInputBorder(),
        suffixIcon: inkwell,
      ),
      validator: validator,
    ),
  );
}

TextField notetitle(TextEditingController title) {
  return TextField(
    style: titlestyle,
    controller: title,
    decoration: InputDecoration(
      hint: header1('Title', align: TextAlign.justify, color: darkgrey),
      border: OutlineInputBorder(borderSide: BorderSide.none),
    ),
  );
}

TextFormField notecontent(TextEditingController content, BuildContext context) {
  return TextFormField(
    style: contentstyle,
    controller: content,
    decoration: InputDecoration(
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height,
      ),
      hint: regular('This is the content of your note'),
      border: OutlineInputBorder(borderSide: BorderSide.none),
    ),
    maxLines: MediaQuery.of(context).size.height.toInt(),
  );
}
