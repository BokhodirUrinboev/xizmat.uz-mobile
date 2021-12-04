import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DateWidget extends StatelessWidget {
  DateWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GetBuilder<DateController>(
          init: DateController(),
        builder: (value) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Date : ",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                overflow: TextOverflow.fade,
                maxLines: 2,
              ),
              SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () async {
                  value.change(context);
                },
                child: Container(
                  height: 35,
                  width: 120,
                  decoration: BoxDecoration(
                      border: Border.all(), borderRadius: BorderRadius.circular(10)),
                  child: Center(child: Text(value.date,style: TextStyle(fontSize: 18),)),
                ),
              )
            ],
          );
        }
      ),
    );
  }
}

class DateController extends GetxController {
  var date = format(DateTime.now());

  change(BuildContext context)async {


    var dateF = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    date = format(dateF!);
  update();
  }
}

format(DateTime time) {
  return DateFormat("dd-MM-yyyy").format(time).toString();
}
