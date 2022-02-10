import 'package:appointment/components/costume_suffix_icon.dart';
import 'package:appointment/models/eventDosenModel.dart';
import 'package:appointment/routs.dart';
import 'package:appointment/screens/details/components/config.dart';
import 'package:appointment/service/pengajuan_repository.dart';
import 'package:appointment/utill/preference.dart';
import 'package:flutter/material.dart';
import 'package:appointment/components/form_error.dart';

import '../../../constants.dart';

class AddEventDosen extends StatefulWidget {
  @override
  _AddEventDosenState createState() => _AddEventDosenState();
}

class _AddEventDosenState extends State<AddEventDosen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now();
  String? titel;
  String? valDosen;
  List<Map<String, dynamic>> dosen = [];
  DateTime? _dateTime;
  TextEditingController? endDate = TextEditingController();
  TextEditingController? txtJamMulai = TextEditingController();
  TextEditingController? txtJamSelesai = TextEditingController();
  TextEditingController title = TextEditingController();
  TextEditingController? startDate = TextEditingController();
  bool remember = false;
  final List<String> errors = [];

  PengajuanRepository repository = new PengajuanRepository();

  bool load = false;

  void save() async {
    String id = await Pref.getIDUser();
    EventDosenModel event = new EventDosenModel();

    event.title = title.text;
    event.startDate = startDate!.text + ' ' + txtJamMulai!.text;
    event.endDate = endDate!.text + ' ' + txtJamSelesai!.text;

    Map<String, dynamic>? respon = await repository.addEventDosen(id, event);
    if (respon!['status'] == true) {
      Config.alert(1, respon['message']);
      Navigator.pushNamed(context, Routes.HOME_DOSEN);
    } else {
      Config.alert(1, respon['message']);
    }
  }

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
    return load
        ? CircularProgressIndicator()
        : Form(
            key: _formKey,
            child: Column(
              children: [
                buildFormField('Judul', 'Masukkan judul jadwal', title, TextInputType.text),
                SizedBox(height: 10),
                buildStartDateFormField(),
                SizedBox(height: 10),
                buildStartTimeFormField(),
                SizedBox(height: 10),
                buildEndDateFormField(),
                SizedBox(height: 10),
                buildEndTimeFormField(),
                SizedBox(height: 10),
                FormError(error: errors),
                SizedBox(height: 40),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Warna().kPrimaryColor,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    ),
                    onPressed: () {
                      save();
                    },
                    child: Text(
                      'Simpan',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
                // DefaultButton(
                //   text: "Simpan",
                //   press: () {
                //     // if (_formKey.currentState!.validate()) {
                //     //   _formKey.currentState!.save();
                //     //   // if all are valid then go to success screen
                //     //   // Navigator.pushNamed(context, CompleteProfileScreen.routeName);
                //     //   context.read<ServiceProvider>().postRequest(title: titel!, endDate: endDate!.text, startDate: startDate!.text, dosen: startDate!.text);
                //     //   Navigator.pop(context);
                //     // }
                //   },
                // ),
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
            firstDate: DateTime(
              2015,
            ),
            lastDate: DateTime(2101));
        if (picked != null && picked != selectedDate) {
          setState(() {
            var tgl = picked.toString().split(" ");
            startDate!.text = tgl[0].toString();
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
        labelText: "Awal Tanggal",
        hintText: "Awal Tanggal",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CostumeSuffixIcon(svgIcon: Icons.date_range_outlined),
      ),
    );
  }

  TextFormField buildStartTimeFormField() {
    return TextFormField(
      controller: txtJamMulai,
      onTap: () async {
        showTimePicker(
          context: context,
          initialEntryMode: TimePickerEntryMode.input,
          initialTime: TimeOfDay.now(),
        ).then((time) {
          if (time != null) {
            setState(() {
              // _dateTime = time;
              txtJamMulai?.text = time.hour.toString() + ':' + time.minute.toString();
              // jamMulai = time.hour.toString() + ':' + time.minute.toString() + ":00"; //value ini yg disimpan
            });
          }
        });
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
        labelText: "Awal Jam",
        hintText: "Awal Jam",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        // floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CostumeSuffixIcon(svgIcon: Icons.date_range_outlined),
      ),
    );
  }

  TextFormField buildEndTimeFormField() {
    return TextFormField(
      controller: txtJamSelesai,
      onTap: () async {
        showTimePicker(
          context: context,
          initialEntryMode: TimePickerEntryMode.input,
          initialTime: TimeOfDay.now(),
        ).then((time) {
          if (time != null) {
            setState(() {
              // _dateTime = time;
              txtJamSelesai?.text = time.hour.toString() + ':' + time.minute.toString();
              // jamMulai = time.hour.toString() + ':' + time.minute.toString() + ":00"; //value ini yg disimpan
            });
          }
        });
      },
      // onSaved: (newValue) => startDate!.text = newValue!,
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
        labelText: "Akhir Jam",
        hintText: "Akhir Jam",
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
        final DateTime? picked = await showDatePicker(context: context, initialDate: selectedDate, firstDate: DateTime(2015, 8), lastDate: DateTime(2101));
        if (picked != null && picked != selectedDate) {
          setState(() {
            var tgl = picked.toString().split(" ");
            endDate!.text = tgl[0].toString();
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
