import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_app/Pertemuan-6/models/color.dart';
import 'package:flutter_app/Pertemuan-6/models/font.dart';
import 'package:flutter_app/Pertemuan-6/models/widgets/components.dart';
import 'package:flutter_app/Pertemuan-6/models/widgets/forms.dart';
import 'package:flutter_app/Pertemuan-6/models/widgets/widget.dart';
import 'package:flutter_app/Pertemuan-6/services/database.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: back(context),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              header1("Register"),
              SizedBox(height: 16),
              regular('And start taking notes'),
              SizedBox(height: 32),
              header2(neutral, 'Full Name'),
              SizedBox(height: 8),
              form(name, regular('Example: John Doe')),
              SizedBox(height: 16),
              header2(neutral, 'Email Address'),
              SizedBox(height: 8),
              form(email, regular('Example: johndoe@gmail.com')),
              SizedBox(height: 16),
              header2(neutral, 'Password'),
              SizedBox(height: 8),
              form(password, regular('********')),
              SizedBox(height: 40),
              button('Register', () async {
                showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (context) {
                    return Center(
                      child: CircularProgressIndicator(color: primary),
                    );
                  },
                );

                await Future.delayed(Duration(seconds: 1));

                final account = await getAccount(name.text, email.text);

                Navigator.pop(context);

                if (account) {
                  showDialog(
                    context: context,
                    builder: (context) => Dialog(
                      insetAnimationDuration: Duration(seconds: 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(8),
                      ),

                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SizedBox(
                          height: 160,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            spacing: 16,
                            children: [
                              header2(primary, 'Nama/Email telah terdaftar'),
                              regular('Silahkan login'),
                              button('Ok', () {
                                Navigator.pop(context);
                                Navigator.pop(context);
                              }),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                  log('nama/email telah terdaftar');
                } else {
                  showDialog(
                    context: context,
                    builder: (context) => Dialog(
                      insetAnimationDuration: Duration(seconds: 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(8),
                      ),

                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SizedBox(
                          height: 160,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: 16,
                            children: [header1('Berhasil', color: primary)],
                          ),
                        ),
                      ),
                    ),
                  );
                  await Future.delayed(Durations.short4);
                  insertAccount(name.text, email.text, password.text);
                  Navigator.pop(context);
                  await Future.delayed(Durations.short2);
                  Navigator.pop(context);
                  log('login sekarang?');
                }
              }),
              SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  header2(primary, 'Already have an account?'),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: header2(primary, 'Login here'),
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
