class PassportData {
    String expiration_date;
    String passport_country;
    String passport_date;
    String passport_number;

    PassportData({required this.expiration_date, required this.passport_country, required this.passport_date, required this.passport_number});

    factory PassportData.fromJson(Map<String, dynamic> json) {
        return PassportData(
            expiration_date: json['expiration_date'], 
            passport_country: json['passport_country'], 
            passport_date: json['passport_date'], 
            passport_number: json['passport_number'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['expiration_date'] = this.expiration_date;
        data['passport_country'] = this.passport_country;
        data['passport_date'] = this.passport_date;
        data['passport_number'] = this.passport_number;
        return data;
    }
}