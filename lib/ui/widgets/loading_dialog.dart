
import 'package:flutter/material.dart';

class LoadingDialog extends StatefulWidget {
  LoadingDialog({Key? key}) : super(key: key);

  @override
  _LoadingDialogState createState() => _LoadingDialogState();
}

class _LoadingDialogState extends State<LoadingDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
//      elevation: 0.0,
      child: dialogContext(context),
    );
  }

  dialogContext(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(
          top: 16,
          bottom: 16,
          left: 16,
          right: 16,
        ),
        margin: EdgeInsets.only(left: 20, right: 20),
        decoration: new BoxDecoration(

          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(16),
//          boxShadow: [
//            BoxShadow(
////              color: Colors.black26,
//              blurRadius: 10.0,
//              offset: const Offset(0.0, 10.0),
//            ),
//          ],
        ),
        child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(),
              Padding(
                padding: EdgeInsets.only(
                  left: 10,
                ),
                child: Text(''),
              )
            ]));
  }
}

class Dialogs {
  static Future<void> showLoadingDialog(
      BuildContext context, GlobalKey key) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new WillPopScope(
              onWillPop: () async => false,
              child: SimpleDialog(
                  key: key,
                  backgroundColor: Colors.white,
                  children: <Widget>[
                    Center(
                      child: Column(children: [
                        CircularProgressIndicator(),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Please Wait....",
                          style: TextStyle(color: Colors.blueAccent),
                        )
                      ]),
                    )
                  ]));
        });
  }
}
