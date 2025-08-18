import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

String? validator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Nama tidak boleh kosong';
  } else if (value.length <= 3) {
    return 'Minimal 3 huruf';
  } else if (!value.contains(RegExp(r'[a, i, u, e, o]'))) {
    return 'Nama tidak valid';
  }

  return null;
}

Future<dynamic> router(BuildContext context, Widget route) async {
  final result = await Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => route),
  );
  if (result == true) {
    context.read<X>().x();
  }
}

class X with ChangeNotifier {
  void x() {
    notifyListeners();
  }
}
