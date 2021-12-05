import 'package:flutter/material.dart';
import 'package:xizmat_uz/generated/l10n.dart';
import 'package:xizmat_uz/model/form/AddressInfo.dart';
import 'package:xizmat_uz/model/form/PersonalData.dart';
import 'package:xizmat_uz/ui/widgets/divider_widget.dart';
import 'package:xizmat_uz/ui/widgets/edited_widget.dart';
import 'package:xizmat_uz/ui/widgets/gender_widget.dart';

class BasicContent extends StatefulWidget {

  BasicContent({Key? key}) : super(key: key);

  @override
  State<BasicContent> createState() => BasicContentState();
}

class BasicContentState extends State<BasicContent> {
  String name = "";

  String additionalName = "";

  String surName = "";

  String phone = "";

  String address = "";

  String pascode = "";

  String gender = "";

  String town = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // InputField(title: S.current.tile,),
        // InputField(title: S.current.application_form,),
        DividerWidget(
          title: S.current.personal_data,
        ),
        InputField(
          valueChanged: (text) {
            name = text;
          },
          title: S.current.name,
        ),
        InputField(
          valueChanged: (text) {
            additionalName = text;
          },
          title: S.current.additional_names,
        ),
        InputField(
          valueChanged: (text) {
            surName = text;
          },
          title: S.current.surname,
        ),
        GenderWidget(
          valueChanged: (text) {
            gender = text;
          },
        ),
        InputField(
          valueChanged: (text) {
            phone = text;
          },
          title: S.current.phone,
        ),
        DividerWidget(
          title: S.current.address_data,
        ),
        InputField(
          valueChanged: (text) {
            address = text;
          },
          title: S.current.street_and_number,
        ),
        // InputField(title: S.current.street_and_hause,),
        InputField(
          valueChanged: (text) {
            pascode = text;
          },
          title: S.current.pascode,
        ),
        InputField(
          valueChanged: (text) {
            town = text;
          },
          title: S.current.town,
        ),
        // InputField(title: S.current.country,),
        // PasswordField(title: S.current.password),
        // PasswordField(title: S.current.repeated_password),
      ],
    );
  }

  AddressInfo getAdressInfo() {
    return AddressInfo(
        address: address,
        city: town,
        country: "Uzbekistan",
        postal_code: pascode);
  }

  PersonalData getpersonaldata() {
    return PersonalData(
        name: name, surname: surName, phone: phone, sex: gender);
  }
}
