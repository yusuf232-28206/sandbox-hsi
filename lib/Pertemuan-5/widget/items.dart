import 'package:flutter/material.dart';
import 'package:flutter_app/Pertemuan-5/model/model.dart';
import 'package:flutter_app/Pertemuan-5/widget/components.dart';

class EditSiswa extends StatelessWidget {
  const EditSiswa({super.key, required this.nama, required this.onChanged});

  final String nama;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        h2('Nama saat ini'),
        TextField(
          enabled: false,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: nama,
          ),
        ),
        SizedBox(height: 8),
        h2('Ubah nama'),
        formFields(onChanged, 'Nama lengkap siswa'),
      ],
    );
  }
}

class TambahSiswa extends StatelessWidget {
  const TambahSiswa({super.key, required this.onChanged});

  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        h2('Nama lengkap'),
        formFields(onChanged, 'Nama lengkap siswa'),
      ],
    );
  }
}

class FormDialog extends StatelessWidget {
  const FormDialog({
    super.key,
    required this.keys,
    required this.height,
    required this.actions,
    required this.child,
  });

  final double height;
  final Widget actions;
  final Widget child;
  final GlobalKey<FormState> keys;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Form(
        key: keys,
        child: SizedBox(height: height, child: child),
      ),
      actions: [actions],
    );
  }
}
