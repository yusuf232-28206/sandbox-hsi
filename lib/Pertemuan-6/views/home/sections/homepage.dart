import 'package:flutter/material.dart';
import 'package:flutter_app/Pertemuan-6/controllers/bloc/page_bloc.dart';
import 'package:flutter_app/Pertemuan-6/controllers/controller.dart';
import 'package:flutter_app/Pertemuan-6/models/color.dart';
import 'package:flutter_app/Pertemuan-6/models/font.dart';
import 'package:flutter_app/Pertemuan-6/models/widgets/widget.dart';

Scaffold homepage(BuildContext context) {
  return Scaffold(
    // Body
    body: Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 245,
              height: 219,
              child: Image.asset('assets/home_idea.png'),
            ),
            SizedBox(height: 32),
            header1('Start your journey'),
            SizedBox(height: 16),

            SizedBox(
              width: 237,
              child: regular(
                align: TextAlign.center,
                'Every big step start with small step. Notes your first idea and start your journey!',
              ),
            ),

            SizedBox(height: 32),

            SizedBox(
              width: 169,
              height: 123,
              child: Image.asset('assets/Arrow.png'),
            ),
          ],
        ),
      ),
    ),

    // FAB
    floatingActionButton: floatingbutton(() async {
      showDialog(
        context: context,
        builder: (context) =>
            dialog([header1('Harap login terlebih dahulu', color: primary)]),
      );

      await delay(100);
      router(context, GoToLoginPage());
      await delay(200);
      Navigator.pop(context);
    }),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
  );
}
