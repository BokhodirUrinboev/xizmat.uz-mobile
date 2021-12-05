import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DateWidget extends StatefulWidget {
  String title;
  ValueChanged valueChanged;

  DateWidget({Key? key, this.title = "",required this.valueChanged}) : super(key: key);

  @override
  State<DateWidget> createState() => _DateWidgetState();
}

class _DateWidgetState extends State<DateWidget> {
  String date = "dd-MM-yyyy";

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              overflow: TextOverflow.fade,
              maxLines: 2,
            ),
            SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: () async {
                onChange();
              },
              child: Container(
                height: 35,
                width: 120,
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                    child: Text(
                  date,
                  style: TextStyle(fontSize: 18),
                )),
              ),
            )
          ],
        ));
  }

  onChange() async {
    var dateF = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    date = format(dateF!);
    widget.valueChanged(date);
    setState(() {

    });
  }
}

//
// class DateController extends GetxController {
//   var date = format(DateTime.now());
//
//   change(BuildContext context) async {
//     var dateF = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2100),
//     );
//
//     date = format(dateF!);
//     update();
//   }
// }
//
// class PDateController extends GetxController {
//   var date = format(DateTime.now());
//
//   change(BuildContext context) async {
//     var dateF = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2100),
//     );
//
//     date = format(dateF!);
//     update();
//   }
// }
//
format(DateTime time) {
  return DateFormat("dd-MM-yyyy").format(time).toString();
}
