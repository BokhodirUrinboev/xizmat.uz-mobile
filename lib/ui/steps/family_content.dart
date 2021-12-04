import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xizmat_uz/generated/l10n.dart';
import 'package:xizmat_uz/ui/constants.dart';
import 'package:xizmat_uz/ui/widgets/date_widget.dart';
import 'package:xizmat_uz/ui/widgets/divider_widget.dart';
import 'package:xizmat_uz/ui/widgets/drop_down_widget.dart';
import 'package:xizmat_uz/ui/widgets/edited_widget.dart';

class FamilyContent extends StatelessWidget {
  FamilyContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DividerWidget(
          title: S.current.personal_information,
        ),
        DateWidget(),
        InputField(
          title: S.current.palce_brith_city,
        ),
        DropDownWidget(
          title: S.current.education,
          items: eduDropDown,
        ),
        DropDownWidget(
          title: S.current.family_status,
          items: familyStatusDropDown,
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 3),
          constraints:
              BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
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
        )
      ],
    );
  }
}
