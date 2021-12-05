import 'Account.dart';

class Accounts {
    List<Account> accounts;

    Accounts({required this.accounts});

    factory Accounts.fromJson(dynamic json) {
        return Accounts(
            accounts: json['data']['accounts'] != null ? (json['data']['accounts']as List).map((i) => Account.fromJson(i)).toList() : [],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if (this.accounts != null) {
            data['accounts'] = this.accounts.map((v) => v.toJson()).toList();
        }
        return data;
    }
}