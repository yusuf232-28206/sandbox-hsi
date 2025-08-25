import 'package:flutter/material.dart';
import 'package:flutter_app/Pertemuan-6/controllers/bloc/page_bloc.dart';
import 'package:flutter_app/Pertemuan-6/controllers/controller.dart';
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
  final keys1 = GlobalKey<FormState>();
  final keys2 = GlobalKey<FormState>();
  final keys3 = GlobalKey<FormState>();

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool view = true;
  bool keys() {
    return (keys1.currentState!.validate() &&
        keys2.currentState!.validate() &&
        keys3.currentState!.validate());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: back(() => router(context, GoToLoginPage())),

      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header
              header1("Register", align: TextAlign.justify),
              SizedBox(height: 16),
              regular('And start taking notes'),
              SizedBox(height: 32),

              // Fields
              header2(neutral, 'Full Name'),
              SizedBox(height: 8),
              form(keys1, name, regular('Example: John Doe')),
              SizedBox(height: 16),
              header2(neutral, 'Email Address'),
              SizedBox(height: 8),
              form(keys2, email, regular('Example: johndoe@gmail.com')),
              SizedBox(height: 16),
              header2(neutral, 'Password'),
              SizedBox(height: 8),
              form(
                keys3,
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

                await delay(1000);

                final account = await getAccount(name.text, email.text);

                Navigator.pop(context);

                if (account && keys()) {
                  showDialog(
                    context: context,
                    builder: (context) =>
                        dialog(align: MainAxisAlignment.spaceBetween, [
                          header2(primary, 'Nama/Email telah terdaftar'),
                          regular('Silahkan login'),
                          button('Ok', () => Navigator.pop(context)),
                        ]),
                  );
                } else if (keys()) {
                  showDialog(
                    context: context,
                    builder: (context) =>
                        dialog([header1('Berhasil', color: primary)]),
                  );

                  await delay(200);
                  insertAccount(name.text, email.text, password.text);
                  Navigator.pop(context);
                  await delay(100);

                  router(context, GoToLoginPage());
                }
              }),
              SizedBox(height: 32),

              // Text Button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  header2(neutral, 'Already have an account?'),
                  TextButton(
                    onPressed: () => router(context, GoToLoginPage()),
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
