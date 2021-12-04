
import 'package:flutter/material.dart';

class DividerWidget extends StatelessWidget {
  String title;
   DividerWidget({Key? key,this.title=""}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          Expanded(
              child: Container(
                height: 1,
                color: Colors.black,
              )),
          Padding(padding: EdgeInsets.symmetric(horizontal: 10),child: Text(title,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),),
          Expanded(
              child: Container(
                height: 1,
                color: Colors.black,
              )),
        ],
      ),
    );
  }
}
