class BiographicData {
    String children_count;
    String city_of_birth;
    String country_of_birth;
    String date_of_birth;
    String education;
    String marital_status;

    BiographicData({required this.children_count, required this.city_of_birth, required this.country_of_birth, required this.date_of_birth, required this.education, required this.marital_status});

    factory BiographicData.fromJson(Map<String, dynamic> json) {
        return BiographicData(
            children_count: json['children_count'], 
            city_of_birth: json['city_of_birth'], 
            country_of_birth: json['country_of_birth'], 
            date_of_birth: json['date_of_birth'], 
            education: json['education'], 
            marital_status: json['marital_status'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['children_count'] = this.children_count;
        data['city_of_birth'] = this.city_of_birth;
        data['country_of_birth'] = this.country_of_birth;
        data['date_of_birth'] = this.date_of_birth;
        data['education'] = this.education;
        data['marital_status'] = this.marital_status;
        return data;
    }
}