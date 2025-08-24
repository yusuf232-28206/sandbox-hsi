import 'package:flutter/material.dart';
import 'package:flutter_app/Pertemuan-6/controllers/bloc/page_bloc.dart';
import 'package:flutter_app/Pertemuan-6/models/color.dart';
import 'package:flutter_app/Pertemuan-6/models/font.dart';
import 'package:flutter_app/Pertemuan-6/models/widgets/widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

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

      await Future.delayed(Durations.short1);
      context.read<PageBloc>().add(GoToLoginPage());
      await Future.delayed(Durations.short4);
      Navigator.pop(context);
    }),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
  );
}
