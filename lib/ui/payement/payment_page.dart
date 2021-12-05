import 'package:flutter/material.dart';
import 'package:future_progress_dialog/future_progress_dialog.dart';
import 'package:get/get.dart';
import 'package:xizmat_uz/network/hasura_client.dart';
import 'package:xizmat_uz/network/local_service.dart';
import 'package:xizmat_uz/ui/payement/selected_paynent.dart';
import 'package:xizmat_uz/ui/widgets/loading_dialog.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  TextEditingController paymentC = TextEditingController();
  HasuraClient client = HasuraClient();
  LocaleService localeService = LocaleService();
  int type = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text("Payment"),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height -
              AppBar().preferredSize.height -
              MediaQuery.of(context).padding.top,
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _inputField(
                        paymentC,
                        Icon(Icons.money, size: 30, color: Color(0xffA6B0BD)),
                        "Введите количество",
                        false),
                    PaymentSelected(
                      valueChanged: (type) {
                        type = type;
                      },
                    ),
                    _loginBtn()
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _loginBtn() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 20, bottom: 50),
      decoration: BoxDecoration(
          color: Color(0xff008FFF),
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Color(0x60008FFF),
              blurRadius: 10,
              offset: Offset(0, 5),
              spreadRadius: 0,
            ),
          ]),
      child: FlatButton(
        onPressed: () {
          // c.duery(ACCOUNT);
          // showComplateSnackBar("Оплата","Платеж принят");

          FocusNode().unfocus();
          Dialogs.showLoadingDialog(context, GlobalKey());

          String  balance=(localeService.getBalance()+int.parse(paymentC.text)).toString();
          client.mutation(
              document:
                  r"""mutation ($account_id:bigint,$amount:money,$type:Int){
              insert_payments(objects: {account_id: $account_id, amount: $amount, type: $type}) {
            affected_rows
          }
    }""",
              variables: {
                "type": type,
                "amount": balance,
                "account_id": localeService.getId()
              }).then((value) {
            client.mutation(
                document: r"""mutation ($amount:money,$account_id:bigint){
  update_balances(_set: {amount: $amount}, where: {account_id: {_eq: $account_id}}) {
    affected_rows
  }
}""",
                variables: {
                  "amount": balance,
                  "account_id": localeService.getId()
                }).then((value) {
              print(value);
              client.mutation(document: r"""mutation ($account_id: bigint) {
  update_service_accounts(where: {account_id: {_eq: $account_id}}, _set: {payment_status: 1}) {
    affected_rows
  }
}""", variables: {"account_id": localeService.getId()}).then((value) {
                Navigator.pop(context);
                Get.back(result: true);
                showComplateSnackBar("Оплата", "Ваш платеж принят");
              });
            });
          });
        },
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Text(
          "Оплата",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w800,
            color: Colors.white,
            letterSpacing: 3,
          ),
        ),
      ),
    );
  }

  Widget _inputField(TextEditingController controller, Icon prefixIcon,
      String hintText, bool isPassword) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 25,
            offset: Offset(0, 5),
            spreadRadius: -25,
          ),
        ],
      ),
      margin: EdgeInsets.only(bottom: 20),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        keyboardType: TextInputType.number,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          color: Color(0xff000912),
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 20),
          hintText: hintText,
          hintStyle: TextStyle(
            color: Color(0xffA6B0BD),
          ),
          fillColor: Colors.white,
          filled: true,
          prefixIcon: prefixIcon,
          prefixIconConstraints: BoxConstraints(
            minWidth: 75,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

showComplateSnackBar(String title, String message) {
  Get.snackbar(title, message,
      backgroundColor: Colors.grey,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(milliseconds: 1500));
}
