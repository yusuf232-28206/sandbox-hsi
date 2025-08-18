import 'package:flutter/material.dart';
import 'package:flutter_app/Pertemuan-6/controllers/controller.dart';
import 'package:flutter_app/Pertemuan-6/models/font.dart';
import 'package:flutter_app/Pertemuan-6/models/widgets/widget.dart';
import 'package:flutter_app/Pertemuan-6/services/database.dart';
import 'package:flutter_app/Pertemuan-6/views/login/login.dart';
import 'package:flutter_app/Pertemuan-6/views/menus/notes.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.page});
  final Widget? page;
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget? page;

  @override
  void initState() {
    super.initState();
    page = widget.page;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<X>(
        builder: (context, value, child) => FutureBuilder<List<Notes>>(
          future: getNotes(),

          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }

            final notes = snapshot.data!;

            return Scaffold(
              body: Center(
                child: Padding(
                  padding: EdgeInsetsGeometry.all(16),
                  child: page.runtimeType == homepage().runtimeType
                      ? homepage()
                      : SingleChildScrollView(child: mainmenu(notes, context)),
                ),
              ),
              floatingActionButton: floatingbutton(context, () async {
                if (page.runtimeType == homepage().runtimeType) {
                  await router(context, Login(notes: notes));
                } else {
                  router(
                    context,
                    Note(
                      notevalue: Notes(title: '', content: ''),
                    ),
                  );
                }
              }),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
            );
          },
        ),
      ),
    );
  }
}

Column homepage() {
  return Column(
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

      SizedBox(width: 169, height: 123, child: Image.asset('assets/Arrow.png')),
    ],
  );
}

Wrap mainmenu(List<Notes> notes, context) {
  return Wrap(
    direction: Axis.horizontal,
    runSpacing: 16,
    spacing: 16,
    children: List.generate(notes.length, (index) {
      return card(
        cardnote(
          context,
          notes,
          notes[index],
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              cardtitle('💡 ${notes[index].title}'),
              SizedBox(height: 16),
              cardcontent(notes[index].content),
            ],
          ),
        ),
      );
    }),
  );
}
