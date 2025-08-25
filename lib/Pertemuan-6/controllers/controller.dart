import 'package:flutter/material.dart';
import 'package:flutter_app/Pertemuan-6/controllers/bloc/page_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

String? validator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Nama tidak boleh kosong';
  } else if (value.length <= 3) {
    return 'Minimal 3 huruf';
  }

  return null;
}

Future<dynamic> delay(int durasi) =>
    Future.delayed(Duration(milliseconds: durasi));

void router(BuildContext context, PageEvent event) =>
    context.read<PageBloc>().add(event);
