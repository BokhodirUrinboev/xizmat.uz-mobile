import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xizmat_uz/model/Accounts.dart';
import 'package:xizmat_uz/network/hasura_client.dart';
import 'package:xizmat_uz/network/local_service.dart';
import 'package:xizmat_uz/network/queries.dart';
import 'package:xizmat_uz/ui/payement/payment_page.dart';
import 'package:xizmat_uz/ui/registration_page.dart';
import 'package:xizmat_uz/ui/widgets/divider_widget.dart';

const String notsubmited = "не представлен";
const String completed = "завершено";
const String win = "победить";
const String lose = "терять";

const String notpaid = "Не оплачен";
const String paid = "Оплаченный";

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HasuraClient client = HasuraClient();
  int payment_status = 0;
  int status = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Профиль"),
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: FutureBuilder(
          future: client.duery(ACCOUNT),
          builder: (ctx, data) {
            if (data.hasData) {
              LocaleService service = LocaleService();

              Accounts ac = Accounts.fromJson(data.data);
              service.setUserId(ac.accounts[0].id);
              service.setBalance(ac.accounts[0].balance);
              return Container(
                  child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                image: AssetImage("assets/images/logo.png"))),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(ac.accounts[0].user.display_name),
                          Text("Баланс: ${service.getBalance()} сум")
                        ],
                      ))
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  DividerWidget(
                    title: "Сервисы",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  FutureBuilder(
                    future: client.duery(SERVICE_ACCOUNTS),
                    builder: (ctx, s) {
                      if (s.hasData) {
                        dynamic data = s.data!;

                        if (data['data']["service_accounts"].length != 0) {
                          payment_status = data['data']["service_accounts"][0]
                              ["payment_status"];
                          status =
                              data['data']["service_accounts"][0]["status"];
                        }


                        return ListView.builder(
                            shrinkWrap: true,
                            itemCount: 1,
                            itemBuilder: (ctx, item) {
                              return GestureDetector(
                                onTap: () async {
                                  var s =
                                      await Get.to(RegistrattionPageWidget());
                                  if (s != null && s) setState(() {});
                                },
                                child: Card(
                                    child: ListTile(
                                  leading: Image.asset(
                                    "assets/images/img_3.png",
                                    height: 35,
                                  ),
                                  subtitle: Text(
                                    getStatus(status).toString(),
                                    style: TextStyle(color: Colors.green),
                                  ),
                                  title: Text("Зеленая карта"),
                                      trailing: Text(getPay(payment_status)),
                                )),
                              );
                            });
                      }

                      return Container(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(),
                        ],
                      ));
                    },
                  ),
                  _loginBtn()
                ],
              ));
            }

            return Container(
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
        ),
      ),
    );
  }

  String getStatus(int st) {
    String status = notpaid;
    switch (st) {
      case 0:
        status = notsubmited;
        break;
      case 1:
        status = paid;
        break;
      case 2:
        status = win;
        break;
      case 3:
        status = lose;
        break;
      default:
        status = "";
    }
    return status;
  }

  String getPay(int st) {
    String status = notpaid;
    switch (st) {
      case 0:
        status = notpaid;
        break;
      case 1:
        status = paid;
        break;
    }

    return status;
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
        onPressed: () async {
          // c.duery(ACCOUNT);
          var s = await Get.to(PaymentPage());

          if (s != null && s) setState(() {});
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
}
