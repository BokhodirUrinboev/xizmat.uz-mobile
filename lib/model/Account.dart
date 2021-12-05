import 'User.dart';

class Account {
  int id;
  User user;
  String balance;

  Account({required this.id, required this.user, required this.balance});

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
        id: json['id'],
        user: User.fromJson(json['user']),
        balance: json["balance"] != null ? json["balance"]["amount"] : "");
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }
}
