import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_app/Pertemuan-6/controllers/controller.dart';
import 'package:flutter_app/Pertemuan-6/models/color.dart';
import 'package:flutter_app/Pertemuan-6/models/font.dart';
import 'package:flutter_app/Pertemuan-6/models/widgets/components.dart';
import 'package:flutter_app/Pertemuan-6/models/widgets/forms.dart';
import 'package:flutter_app/Pertemuan-6/services/database.dart';
import 'package:flutter_app/Pertemuan-6/views/home/home.dart';
import 'package:flutter_app/Pertemuan-6/views/register/registration.dart';

class Login extends StatefulWidget {
  const Login({super.key, required this.notes});
  final List<Notes> notes;

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                header1("Let's Login"),
                SizedBox(height: 16),
                regular('And notes your idea'),
                SizedBox(height: 32),
                header2(neutral, 'Username'),
                SizedBox(height: 8),

                form(email, regular('example@mail.com')),
                SizedBox(height: 16),
                header2(neutral, 'Password'),
                SizedBox(height: 8),
                form(password, regular('********')),
                SizedBox(height: 70),

                button('Login', () async {
                  showDialog(
                    context: context,

                    builder: (context) => Center(
                      child: CircularProgressIndicator(color: primary),
                    ),
                  );

                  await Future.delayed(Durations.extralong4);

                  var notValid = await loginAccount(email.text, password.text);

                  Navigator.pop(context);

                  if (notValid) {
                    log('error username atau password salah');
                  } else {
                    log('berhasil');
                    router(
                      context,
                      Home(page: mainmenu(widget.notes, context)),
                    );
                  }
                }),
                SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    header2(primary, "Don't have any account?"),
                    TextButton(
                      onPressed: () {
                        router(context, Registration());
                      },
                      child: header2(primary, 'Register here'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
