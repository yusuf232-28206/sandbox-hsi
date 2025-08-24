import 'package:flutter/material.dart';
import 'package:flutter_app/Pertemuan-6/controllers/bloc/page_bloc.dart';
import 'package:flutter_app/Pertemuan-6/models/color.dart';
import 'package:flutter_app/Pertemuan-6/models/font.dart';
import 'package:flutter_app/Pertemuan-6/models/widgets/components.dart';
import 'package:flutter_app/Pertemuan-6/models/widgets/forms.dart';

import 'package:flutter_app/Pertemuan-6/models/widgets/widget.dart';
import 'package:flutter_app/Pertemuan-6/services/database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Note extends StatefulWidget {
  const Note({super.key, required this.notevalue});
  final Notes notevalue;

  @override
  State<Note> createState() => _NoteState();
}

class _NoteState extends State<Note> {
  late TextEditingController title;
  late TextEditingController content;

  @override
  void initState() {
    title = TextEditingController(text: widget.notevalue.title);
    content = TextEditingController(text: widget.notevalue.content);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Appbar
      appBar: back(() => context.read<PageBloc>().add(GoToMainMenuPage())),

      // Body
      body: SingleChildScrollView(
        child: Column(
          children: [notetitle(title), notecontent(content, context)],
        ),
      ),

      // Bottom
      bottomNavigationBar: bottom(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
              'Last edited on ${TimeOfDay.now().format(context)}',
            ),
            Container(
              height: 48,
              width: 48,
              color: primary,
              child: IconButton(
                icon: Icon(Icons.more_horiz, color: Colors.white),
                onPressed: () {
                  // Modal Bottom Sheet
                  showModalBottomSheet(
                    constraints: BoxConstraints(minWidth: double.maxFinite),
                    context: context,
                    builder: (context) => Container(
                      padding: EdgeInsets.fromLTRB(16, 8, 16, 16),
                      height: MediaQuery.of(context).size.height / 4,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerRight,
                              child: close(() => Navigator.pop(context)),
                            ),
                            SizedBox(height: 8),

                            // Finish Button
                            tiles(
                              Icons.check,
                              header2(null, 'Mark as Finished'),
                              Colors.green,
                              () async {
                                if (widget.notevalue.id == null) {
                                  insertNote(
                                    Notes(
                                      title: title.text,
                                      content: content.text,
                                    ),
                                  );
                                  Navigator.pop(context);
                                  context.read<PageBloc>().add(
                                    GoToMainMenuPage(),
                                  );
                                } else {
                                  updateNote(
                                    Notes(
                                      id: widget.notevalue.id,
                                      title: title.text,
                                      content: content.text,
                                    ),
                                  );
                                  Navigator.pop(context);
                                  context.read<PageBloc>().add(
                                    GoToMainMenuPage(),
                                  );
                                }

                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    Future.delayed(
                                      Durations.extralong4,
                                    ).then((value) => Navigator.pop(context));
                                    return Center(
                                      child: CircularProgressIndicator(
                                        color: primary,
                                      ),
                                    );
                                  },
                                );
                              },
                            ),

                            Divider(),

                            // Delete Button
                            tiles(
                              Icons.delete_outline,
                              header2(null, 'Delete Note'),
                              Colors.red,
                              () async {
                                if (widget.notevalue.id != null) {
                                  deleteNote(widget.notevalue.id!);
                                }

                                Navigator.pop(context);
                                context.read<PageBloc>().add(
                                  GoToMainMenuPage(),
                                );

                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    Future.delayed(
                                      Durations.extralong4,
                                    ).then((value) => Navigator.pop(context));
                                    return Center(
                                      child: CircularProgressIndicator(
                                        color: primary,
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
