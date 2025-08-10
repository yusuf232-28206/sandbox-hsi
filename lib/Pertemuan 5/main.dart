import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'assets/data_siswa.dart';
import 'model/model.dart';
import 'view/body.dart';
import 'widget/components.dart';
import 'widget/items.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowMaterialGrid: false, home: Home());
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String data;

  final _key = GlobalKey<FormState>();
  final String keys = 'data';

  @override
  void initState() {
    super.initState();

    getData();
  }

  void getData() async {
    final SharedPreferences listSiswa = await SharedPreferences.getInstance();

    final dataSiswa = listSiswa.getStringList(keys);

    setState(() {
      siswa = dataSiswa ?? siswa;
    });
  }

  void onPressed() async {
    if (_key.currentState!.validate()) {
      setState(() {
        siswa.add(data);
      });

      Navigator.pop(context);
    }

    final listSiswa = await SharedPreferences.getInstance();
    listSiswa.setStringList(keys, siswa);
  }

  void onChanged(value) {
    setState(() {
      data = value;
    });
  }

  void onPressedButton(index) async {
    if (_key.currentState!.validate()) {
      setState(() {
        siswa[index] = data;
      });

      Navigator.pop(context);
    }

    final listSiswa = await SharedPreferences.getInstance();
    listSiswa.setStringList(keys, siswa);
  }

  add() {
    showDialog(
      context: context,
      builder: (context) {
        return FormDialog(
          keys: _key,
          height: 80,
          actions: formAdd(onPressed),
          child: TambahSiswa(onChanged: onChanged),
        );
      },
    );
  }

  edit(index) {
    showDialog(
      context: context,
      builder: (context) {
        return FormDialog(
          keys: _key,
          height: 180,
          actions: formEdit((index) => onPressedButton(index), index),
          child: EditSiswa(nama: siswa[index], onChanged: onChanged),
        );
      },
    );
  }

  void delete(index) async {
    setState(() {
      siswa.removeAt(index);
    });

    final listSiswa = await SharedPreferences.getInstance();
    listSiswa.setStringList(keys, siswa);
  }

  Row items(int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        text(siswa[index]),

        Row(
          children: [
            editButton(() => edit(index)),

            deleteButton(() => delete(index)),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return scaff(
      Column(
        children: [
          Align(alignment: Alignment.bottomLeft, child: header),

          Flexible(
            child: datasiswa(siswa.length, (context, index) {
              return Row(
                children: [
                  SizedBox(width: 40, child: text('${index + 1}.')),
                  Expanded(child: items(index)),
                ],
              );
            }),
          ),

          addButton(() => add()),
        ],
      ),
    );
  }
}
