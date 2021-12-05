import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xizmat_uz/generated/l10n.dart';

enum Gender { MALE, FEMALE }

class GenderWidget extends StatefulWidget {
  ValueChanged valueChanged;

  GenderWidget({Key? key,required this.valueChanged}) : super(key: key);

  @override
  _GenderWidgetState createState() => _GenderWidgetState();
}

class _GenderWidgetState extends State<GenderWidget> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<GenderController>(
        init: GenderController(),
        builder: (value) {

          widget.valueChanged(value.gender.toString().toLowerCase());
          return Row(
            children: [
              Row(
                children: [
                  Radio(
                      value: Gender.MALE,
                      groupValue: value.gender,
                      onChanged: value.change),
                  Text(S.current.male)
                ],
              ),
              SizedBox(
                width: 20,
              ),
              Row(
                children: [
                  Radio(
                      value: Gender.FEMALE,
                      groupValue: value.gender,
                      onChanged: value.change),
                  Text(S.current.female)
                ],
              ),
            ],
          );
        });
  }
}

class GenderController extends GetxController {
  var gender = Gender.MALE;

  change(g) {
    gender = g;
    update();
  }
}
