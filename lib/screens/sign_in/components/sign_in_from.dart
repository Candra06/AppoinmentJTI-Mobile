// ignore_for_file: implementation_imports, unrelated_type_equality_checks

import 'package:appointment/components/befault_button.dart';
import 'package:appointment/components/form_error.dart';
import 'package:appointment/screens/home/home_screen.dart';
import 'package:appointment/screens/home/main_screen_admin.dart';
import 'package:appointment/screens/home/main_screen_dosen.dart';
import 'package:appointment/screens/home/main_screen_mahasiswa.dart';
import 'package:appointment/service/sercive_provider.dart';
import 'package:appointment/utill/preference.dart';
import 'package:provider/src/provider.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  late String email, password;
  final List<String> error = [];
  bool remember = false;

  @override
  Widget build(BuildContext context) {
    var _data = Provider.of<ServiceProvider>(context, listen: false);
    return Form(
      key: _formKey,
      child: Column(
        children: [
          builEmailFormField(),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          builPasswordFormField(),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          FormError(error: error),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          DefaultButton(
            text: "Continue",
            press: () async {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                var _log = await _data.authentification(email: email, password: password);
                String role = await Pref.getRole();
                print(_log);
                if (_log == true) {
                  // _log.whenComplete(() => Navigator.pushReplacementNamed(
                  //     context, HomeScreen.routeName));
                  // _log.onError((ex, stackTrace) => error.add("Fail Logins"));
                  setState(() {
                    final snackBar = SnackBar(
                      backgroundColor: Colors.blue,
                      content: const Text('Login Berhasil'),
                      // action: SnackBarAction(
                      //   label: 'Oke',
                      //   onPressed: () {
                      //     // Some code to undo the change.
                      //   },
                      // ),
                    );
                    if (role == '1') {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => MainScreenAdmin()));
                    } else if (role == '2') {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => MainScreenDosen()));
                    } else if (role == '3') {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => MainScreenMahasiswa()));
                    }

                    // Find the ScaffoldMessenger in the widget tree
                    // and use it to show a SnackBar.
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  });
                }
              }
            },
          )
        ],
      ),
    );
  }

  TextFormField builPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue!,
      onChanged: (value) {
        if (value.isEmpty && error.contains(kPassNullError)) {
          setState(() {
            error.remove(kPassNullError);
          });
        } else if (value.length >= 3 && error.contains(kShortPassError)) {
          setState(() {
            error.remove(kShortPassError);
          });
        }
      },
      validator: (value) {
        if (value!.isEmpty && !error.contains(kPassNullError)) {
          setState(() {
            error.add(kPassNullError);
          });
        } else if (value.length < 3 && !error.contains(kShortPassError)) {
          setState(() {
            error.add(kShortPassError);
          });
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(
          Icons.lock_outline,
        ),
      ),
    );
  }

  TextFormField builEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty && error.contains(kEmailNullError)) {
          setState(() {
            error.remove(kEmailNullError);
          });
        } else if (emailValidatorRegExp.hasMatch(value) && error.contains(kInvalidEmailError)) {
          setState(() {
            error.remove(kInvalidEmailError);
          });
        }
      },
      validator: (value) {
        if (value!.isEmpty && !error.contains(kEmailNullError)) {
          setState(() {
            error.add(kEmailNullError);
          });
        } else if (!emailValidatorRegExp.hasMatch(value) && !error.contains(kInvalidEmailError)) {
          setState(() {
            error.add(kInvalidEmailError);
          });
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(
          Icons.email_outlined,
        ),
      ),
    );
  }
}
