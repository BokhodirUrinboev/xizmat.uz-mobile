class AddressInfo {
    String address;
    String city;
    String country;
    String postal_code;

    AddressInfo({required this.address, required this.city, required this.country, required this.postal_code});

    factory AddressInfo.fromJson(Map<String, dynamic> json) {
        return AddressInfo(
            address: json['address'], 
            city: json['city'], 
            country: json['country'], 
            postal_code: json['postal_code'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['address'] = this.address;
        data['city'] = this.city;
        data['country'] = this.country;
        data['postal_code'] = this.postal_code;
        return data;
    }
}