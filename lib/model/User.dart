class User {
    String display_name;

    User({required this.display_name,});

    factory User.fromJson(Map<String, dynamic> json) {
        return User(
            display_name: json['display_name'], 

        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['display_name'] = this.display_name;

        return data;
    }
}