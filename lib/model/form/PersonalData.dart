class PersonalData {
  String name;
  String phone;
  String sex;
  String surname;

  PersonalData(
      {required this.name,
      required this.phone,
      required this.sex,
      required this.surname});

  factory PersonalData.fromJson(Map<String, dynamic> json) {
    return PersonalData(
      name: json['name'],
      phone: json['phone'],
      sex: json['sex'],
      surname: json['surname'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['sex'] = this.sex;
    data['surname'] = this.surname;
    return data;
  }
}
