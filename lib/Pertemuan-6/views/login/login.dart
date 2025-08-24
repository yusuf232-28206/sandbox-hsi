import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_app/Pertemuan-6/controllers/bloc/page_bloc.dart';
import 'package:flutter_app/Pertemuan-6/models/color.dart';
import 'package:flutter_app/Pertemuan-6/models/font.dart';
import 'package:flutter_app/Pertemuan-6/models/widgets/components.dart';
import 'package:flutter_app/Pertemuan-6/models/widgets/forms.dart';
import 'package:flutter_app/Pertemuan-6/models/widgets/widget.dart';
import 'package:flutter_app/Pertemuan-6/services/database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final keys1 = GlobalKey<FormState>();
  final keys2 = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool view = true;
  bool keys() {
    return (keys1.currentState!.validate() && keys2.currentState!.validate());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header
              header1("Let's Login", align: TextAlign.justify),
              SizedBox(height: 16),
              regular('And notes your idea'),
              SizedBox(height: 32),

              // Fields
              header2(neutral, 'Username'),
              SizedBox(height: 8),
              form(keys1, email, regular('example@mail.com')),
              SizedBox(height: 16),
              header2(neutral, 'Password'),
              SizedBox(height: 8),
              form(
                keys2,
                password,
                regular('********'),
                view: view,
                inkwell: viewbutton(
                  view,
                  () => setState(() {
                    view = !view;
                  }),
                ),
              ),
              SizedBox(height: 70),

              // Button
              button('Login', () async {
                showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (context) =>
                      Center(child: CircularProgressIndicator(color: primary)),
                );

                await Future.delayed(Durations.extralong4);

                var notValid = await loginAccount(email.text, password.text);

                Navigator.pop(context);

                if (notValid) {
                  log('error username atau password salah');
                  showDialog(
                    context: context,
                    builder: (context) {
                      Future.delayed(
                        Durations.medium4,
                      ).then((value) => Navigator.pop(context));

                      return dialog([
                        header1('Username atau Password salah', color: primary),
                      ]);
                    },
                  );
                } else if (keys()) {
                  log('berhasil');
                  context.read<PageBloc>().add(GoToMainMenuPage());
                }
              }),
              SizedBox(height: 32),

              // Text Button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  header2(neutral, "Don't have any account?"),
                  TextButton(
                    onPressed: () {
                      context.read<PageBloc>().add(GoToRegisterPage());
                    },
                    child: header2(primary, 'Register here'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
