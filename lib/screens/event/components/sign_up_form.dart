// ignore_for_file: non_constant_identifier_names, use_key_in_widget_constructors, avoid_returning_null_for_void, implementation_imports

import 'package:appointment/components/costume_suffix_icon.dart';
import 'package:appointment/service/sercive_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:appointment/components/befault_button.dart';
import 'package:appointment/components/form_error.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now();
  String? titel;
  TextEditingController? endDate = TextEditingController();
  TextEditingController? startDate = TextEditingController();
  bool remember = false;
  final List<String> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error!);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  void initState() {
    endDate!.text = "";
    startDate!.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildTitelFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildStartDateFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildEndDateFormField(),
          FormError(error: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: "Simpan",
            press: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                // if all are valid then go to success screen
                // Navigator.pushNamed(context, CompleteProfileScreen.routeName);
                context.read<ServiceProvider>().postJadwal(
                    title: titel!,
                    endDate: endDate!.text,
                    startDate: startDate!.text,
                    id: '');
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildStartDateFormField() {
    return TextFormField(
      controller: startDate,
      onTap: () async {
        final DateTime? picked = await showDatePicker(
            context: context,
            initialDate: selectedDate,
            firstDate: DateTime(2015, 8),
            lastDate: DateTime(2101));
        if (picked != null && picked != selectedDate) {
          setState(() {
            startDate!.text = picked.toString();
          });
        }
      },
      onSaved: (newValue) => startDate!.text = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kDateStartError);
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kDateStartError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Awal Waktu",
        hintText: "Awal Waktu",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CostumeSuffixIcon(svgIcon: Icons.date_range_outlined),
      ),
    );
  }

  TextFormField buildEndDateFormField() {
    return TextFormField(
      controller: endDate,
      onTap: () async {
        final DateTime? picked = await showDatePicker(
            context: context,
            initialDate: selectedDate,
            firstDate: DateTime(2015, 8),
            lastDate: DateTime(2101));
        if (picked != null && picked != selectedDate) {
          setState(() {
            endDate!.text = picked.toString();
          });
        }
      },
      onSaved: (newValue) => endDate!.text = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kDateEndError);
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kDateEndError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Akhir Waktu",
        hintText: "Enter your Akhir Waktu",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CostumeSuffixIcon(svgIcon: Icons.date_range_outlined),
      ),
    );
  }

  TextFormField buildTitelFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => titel = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kTitelNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kTitelNullError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Titel",
        hintText: "Enter your titel",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CostumeSuffixIcon(svgIcon: Icons.title_outlined),
      ),
    );
  }
}
