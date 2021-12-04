
import 'package:flutter/material.dart';
import 'package:xizmat_uz/generated/l10n.dart';
import 'package:xizmat_uz/ui/widgets/divider_widget.dart';
import 'package:xizmat_uz/ui/widgets/edited_widget.dart';
import 'package:xizmat_uz/ui/widgets/gender_widget.dart';

class BasicContent extends StatelessWidget {
  const BasicContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        // InputField(title: S.current.tile,),
        // InputField(title: S.current.application_form,),
        DividerWidget(title: S.current.personal_data,),
        InputField(
          title: S.current.name,
        ),
        InputField(
          title: S.current.additional_names,
        ),
        InputField(
          title: S.current.surname,
        ),
        GenderWidget(),
        InputField(
          title: S.current.phone,
        ),
        DividerWidget(title: S.current.address_data,),
        InputField(title: S.current.street_and_number,),
        InputField(title: S.current.street_and_hause,),
        InputField(title: S.current.pascode,),
        InputField(title: S.current.town,),
        InputField(title: S.current.country,),
        // PasswordField(title: S.current.password),
        // PasswordField(title: S.current.repeated_password),
      ],
    );
  }
}
