

import 'package:flutter/material.dart';


class PasswordField extends StatelessWidget {
  String title;
  String helperText = "";
  TextInputType inputType;

  PasswordField(
      {Key? key,
        this.title = "",
        this.helperText = "",
        this.inputType = TextInputType.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.symmetric(vertical: 3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            overflow: TextOverflow.fade,
            maxLines: 2,
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            height: 40,
            child: TextFormField(
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,

              style: TextStyle(fontSize: 15),
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.visibility),
                contentPadding: EdgeInsets.all(10),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8))),

                helperStyle: TextStyle(height: 0.3),
                // helperText: helperText
              ),
            ),
          ),
        ],
      ),
    );
  }
}
