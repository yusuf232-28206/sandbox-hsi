import 'package:flutter/material.dart';
import 'package:flutter_app/Pertemuan-6/controllers/bloc/page_bloc.dart';
import 'package:flutter_app/Pertemuan-6/controllers/controller.dart';
import 'package:flutter_app/Pertemuan-6/models/font.dart';
import 'package:flutter_app/Pertemuan-6/models/widgets/widget.dart';
import 'package:flutter_app/Pertemuan-6/services/database.dart';

Scaffold mainmenu(List<Notes> notes, BuildContext context) {
  return Scaffold(
    // Body
    body: SafeArea(
      child: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Wrap(
            direction: Axis.horizontal,
            runSpacing: 16,
            spacing: 16,
            children: List.generate(notes.length, (index) {
              return card(
                cardnote(
                  () => router(context, GoToNotesPage(notes[index])),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      cardtitle('💡 ${notes[index].title}'),
                      Container(height: 16),
                      cardcontent(notes[index].content),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    ),

    // FAB
    floatingActionButton: floatingbutton(
      () => router(context, GoToNotesPage(Notes(title: '', content: ''))),
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
  );
}
