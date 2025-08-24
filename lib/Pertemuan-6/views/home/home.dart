import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_app/Pertemuan-6/controllers/bloc/page_bloc.dart';
import 'package:flutter_app/Pertemuan-6/services/database.dart';
import 'package:flutter_app/Pertemuan-6/views/home/sections/homepage.dart';
import 'package:flutter_app/Pertemuan-6/views/home/sections/mainmenu.dart';
import 'package:flutter_app/Pertemuan-6/views/login/login.dart';
import 'package:flutter_app/Pertemuan-6/views/menus/notes.dart';
import 'package:flutter_app/Pertemuan-6/views/register/registration.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final x = context.watch<PageBloc>().state;
    log('$x');

    return Scaffold(
      resizeToAvoidBottomInset: true,

      // Notes Future Builder
      body: FutureBuilder<List<Notes>>(
        future: getNotes(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          final notes = snapshot.data!;

          // Bloc Builder
          return BlocBuilder<PageBloc, PageState>(
            builder: (context, state) {
              switch (state) {
                case LoginPageState():
                  return Login();

                case RegisterPageState():
                  return Registration();

                case NotesPageState():
                  return Note(notevalue: state.value);

                case HomePageState():
                  return homepage(context);

                case MainMenuPageState():
                  return mainmenu(notes, context);

                default:
                  return Center(child: CircularProgressIndicator());
              }
            },
          );
        },
      ),
    );
  }
}
