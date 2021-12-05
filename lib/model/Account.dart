import 'User.dart';

class Account {
    int id;
    User user;

    Account({required this.id, required this.user});

    factory Account.fromJson(Map<String, dynamic> json) {
        return Account(
            id: json['id'], 
            user: User.fromJson(json['user']),
        );
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