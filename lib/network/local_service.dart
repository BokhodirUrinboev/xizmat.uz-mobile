import 'package:hive/hive.dart';

class LocaleService {
  Box? box;

  openHive() {
    box = Hive.box('token');
  }

  void jwtToken(String jwtToken) async {
    openHive();
    box!.put("jwtToken", "Bearer ${jwtToken}");
  }

  String getToken() {
    openHive();

    return box!.get("jwtToken");
  }

  int getId() {
    openHive();

    return box!.get("id");
  }

  void setUserId(int id) {
    openHive();

    box!.put("id", id);
  }

  setBalance(String balance) {
    openHive();
    double bl = double.parse(balance.replaceAll(",", "").replaceAll("\$", ""));

    box!.put("balance", bl);
  }

  double getBalance() {
    openHive();

    return box!.get("balance");
  }
}
