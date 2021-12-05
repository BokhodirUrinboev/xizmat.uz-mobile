import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xizmat_uz/model/Accounts.dart';
import 'package:xizmat_uz/network/hasura_client.dart';
import 'package:xizmat_uz/network/local_service.dart';
import 'package:xizmat_uz/network/queries.dart';
import 'package:xizmat_uz/ui/registration_page.dart';
import 'package:xizmat_uz/ui/widgets/divider_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HasuraClient client = HasuraClient();

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
                                image: AssetImage("assets/images/img_2.png"))),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [Text(ac.accounts[0].user.display_name)],
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
                  Expanded(
                      child: ListView.builder(
                          itemCount: 1,
                          itemBuilder: (ctx, item) {
                            return GestureDetector(
                              onTap: () {
                                Get.to(RegistrattionPageWidget());
                              },
                              child: Card(
                                  child: ListTile(
                                leading: Image.asset(
                                  "assets/images/img_3.png",
                                  height: 35,
                                ),
                                subtitle: Text(
                                  "проверяется",
                                  style: TextStyle(color: Colors.green),
                                ),
                                title: Text("Green card"),
                              )),
                            );
                          }))
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
}
