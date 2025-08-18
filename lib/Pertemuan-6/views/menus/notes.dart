import 'package:flutter/material.dart';
import 'package:flutter_app/Pertemuan-6/models/color.dart';
import 'package:flutter_app/Pertemuan-6/models/font.dart';
import 'package:flutter_app/Pertemuan-6/models/widgets/components.dart';
import 'package:flutter_app/Pertemuan-6/models/widgets/forms.dart';

import 'package:flutter_app/Pertemuan-6/models/widgets/widget.dart';
import 'package:flutter_app/Pertemuan-6/services/database.dart';

class Note extends StatefulWidget {
  const Note({super.key, required this.notevalue});
  final Notes notevalue;

  @override
  State<Note> createState() => _NoteState();
}

class _NoteState extends State<Note> {
  @override
  Widget build(BuildContext context) {
    TextEditingController title = TextEditingController(
      text: widget.notevalue.title,
    );
    TextEditingController content = TextEditingController(
      text: widget.notevalue.content,
    );

    return Scaffold(
      appBar: back(context),
      body: SingleChildScrollView(
        child: Column(
          children: [notetitle(title), notecontent(content, context)],
        ),
      ),
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
                  showModalBottomSheet(
                    constraints: BoxConstraints(minWidth: double.maxFinite),
                    context: context,
                    builder: (context) => Container(
                      padding: EdgeInsets.fromLTRB(16, 8, 16, 16),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerRight,
                            child: close(() => {}),
                          ),
                          SizedBox(height: 8),

                          tiles(
                            Icons.check,
                            header2(null, 'Mark as Finished'),
                            Colors.green,
                            () {
                              if (widget.notevalue.id == null) {
                                insertNote(
                                  Notes(
                                    title: title.text,
                                    content: content.text,
                                  ),
                                );
                                Navigator.pop(context, true);
                                Navigator.pop(context, true);
                              } else {
                                updateNote(
                                  Notes(
                                    id: widget.notevalue.id,
                                    title: title.text,
                                    content: content.text,
                                  ),
                                );
                                Navigator.pop(context, true);
                                Navigator.pop(context, true);
                              }
                            },
                          ),

                          Divider(),

                          tiles(
                            Icons.delete_outline,
                            header2(null, 'Delete Note'),
                            Colors.red,
                            () {
                              deleteNote(widget.notevalue.id!);

                              Navigator.pop(context, true);
                              Navigator.pop(context, true);
                            },
                          ),
                        ],
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
