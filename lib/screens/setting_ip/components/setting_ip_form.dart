import 'package:appointment/components/befault_button.dart';
import 'package:appointment/components/costume_suffix_icon.dart';
import 'package:appointment/components/form_error.dart';
import 'package:appointment/screens/sign_in/sign_in_screen.dart';
import 'package:appointment/service/sercive_provider.dart';
import 'package:appointment/utill/ip_setting.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SettingIpForm extends StatefulWidget {
  const SettingIpForm({Key? key}) : super(key: key);
  @override
  State<SettingIpForm> createState() => _SettingIpFormState();
}

class _SettingIpFormState extends State<SettingIpForm> {
  TextEditingController ipController = new TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final List<String> error = [];

  @override
  void initState() {
    setState(() {
      ipController.text = "";
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _data = Provider.of<ServiceProvider>(context, listen: false);
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.text,
            controller: ipController,
            onChanged: (value) {
              if (value.isNotEmpty && error.contains(kEmailNullError)) {
                setState(() {
                  error.remove(kEmailNullError);
                });
              } else if (emailValidatorRegExp.hasMatch(value) &&
                  error.contains(kInvalidEmailError)) {
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
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: "Ip",
              hintText: "Enter your Ip",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CostumeSuffixIcon(
                svgIcon: Icons.mail_outline,
              ),
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          FormError(error: error),
          SizedBox(
            height: SizeConfig.screenHeight! * 0.1,
          ),
          DefaultButton(
            text: "Continue",
            press: () {
              if (_formKey.currentState!.validate()) {
                // Lakukan Apa yang ingin aku lakukan
                IpSetting().setIp(ipController.text);
                _data.getIp();
                Navigator.pushReplacementNamed(context, SignInScreen.routeName);
              }
            },
          ),
          SizedBox(
            height: SizeConfig.screenHeight! * 0.1,
          ),
          // const NoAccountText(),
        ],
      ),
    );
  }
}
