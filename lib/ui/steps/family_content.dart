import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xizmat_uz/generated/l10n.dart';
import 'package:xizmat_uz/model/form/BiographicData.dart';
import 'package:xizmat_uz/model/form/PassportData.dart';
import 'package:xizmat_uz/ui/constants.dart';
import 'package:xizmat_uz/ui/widgets/date_widget.dart';
import 'package:xizmat_uz/ui/widgets/divider_widget.dart';
import 'package:xizmat_uz/ui/widgets/drop_down_widget.dart';
import 'package:xizmat_uz/ui/widgets/edited_widget.dart';

class FamilyContent extends StatefulWidget {

  FamilyContent({Key? key}) : super(key: key);

  @override
  State<FamilyContent> createState() => FamilyContentState();
}

class FamilyContentState extends State<FamilyContent> {
  String city_of_birth = "";

  String edu = "";

  String family_status = "";

  String children = "";

  String pasport_number = "";

  String passport_date = "";

  String expiration_date = "";

  String date_of_birth = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DividerWidget(
          title: S.current.personal_information,
        ),
        DateWidget(
          valueChanged: (date) {
            date_of_birth = date;
          },
          title: 'Дата рождения',
        ),
        InputField(
          valueChanged: (text) {
            city_of_birth = text;
          },
          title: S.current.palce_brith_city,
        ),
        DropDownWidget(
          selectedItem: (text) {
            edu = text;
          },
          title: S.current.education,
          items: eduDropDown,
        ),
        DropDownWidget(
          selectedItem: (text) {
            family_status = text;
          },
          title: S.current.family_status,
          items: familyStatusDropDown,
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 3),
          constraints:
          BoxConstraints(maxWidth: MediaQuery
              .of(context)
              .size
              .width * 0.7),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "${S.current.unmarried_children_born}: ",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Container(
                  height: 35,
                  width: 100,
                  child: TextFormField(
                    // obscureText: isPassword,
                    onChanged: (text) {
                      children = text;
                    },
                    keyboardType: TextInputType.number,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      helperStyle: TextStyle(height: 0.3),

                      // helperText: helperText
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        DividerWidget(
          title: S.current.passport_data,
        ),
        InputField(
          valueChanged: (text) {
            pasport_number = text;
          },
          title: "Номер паспорта",
        ),
        // InputField(
        //   valueChanged: (text) {},
        //   title: "Страна выпуска ",
        // ),

        DateWidget(
          valueChanged: (date) {},
          title: "Дата выдачи",),
        DateWidget(
          valueChanged: (date) {},
          title: "Дата истечения",),

      ],
    );
  }

  PassportData getPassportData() {
    return PassportData(passport_country: "Uzbekistan",
        passport_date: passport_date,
        passport_number: pasport_number,
        expiration_date: expiration_date);
  }

  BiographicData getBiographicdata() {
    return BiographicData(children_count: children,
        city_of_birth: city_of_birth,
        country_of_birth: "Uzbekistan",
        date_of_birth: date_of_birth,
        education: edu,
        marital_status: family_status);
  }
}
