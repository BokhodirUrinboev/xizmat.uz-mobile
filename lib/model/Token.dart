import 'User.dart';

class Token {
    int jwt_expires_in;
    String jwt_token;
    User user;

    Token({required this.jwt_expires_in, required this.jwt_token, required this.user});

    factory Token.fromJson(Map<String, dynamic> json) {
        return Token(
            jwt_expires_in: json['jwt_expires_in'], 
            jwt_token: json['jwt_token'], 
            user: User.fromJson(json['user']),
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['jwt_expires_in'] = this.jwt_expires_in;
        data['jwt_token'] = this.jwt_token;
        if (this.user != null) {
            data['user'] = this.user.toJson();
        }
        return data;
    }
}