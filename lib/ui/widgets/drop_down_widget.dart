import 'package:flutter/material.dart';



class DropDownWidget extends StatefulWidget {
  String title;
  List<String> items;

  DropDownWidget(
      {Key? key,
      this.title = "",
      required this.items})
      : super(key: key);

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  late String _chosenValue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _chosenValue = widget.items.first;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            overflow: TextOverflow.fade,
            maxLines: 2,
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10)),
              child: DropdownButton<String>(
                isExpanded: true,
                focusColor: Colors.white,
                value: _chosenValue,
                //elevation: 5,
                underline: Container(),
                style: TextStyle(color: Colors.white),
                iconEnabledColor: Colors.black,
                items:
                    widget.items.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(color: Colors.black),
                    ),
                  );
                }).toList(),
                hint: Text(
                  "Please choose a langauage",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                onChanged: (s) {
                  setState(() {
                    _chosenValue = s!;
                  });
                },
              )),
        ],
      ),
    );
  }
}
