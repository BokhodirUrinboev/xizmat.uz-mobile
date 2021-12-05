import 'AddressInfo.dart';
import 'BiographicData.dart';
import 'PassportData.dart';
import 'PersonalData.dart';

class Form {
    AddressInfo address_info;
    BiographicData biographic_data;
    PassportData passport_data;
    PersonalData personal_data;

    Form({required this.address_info, required this.biographic_data, required this.passport_data, required this.personal_data});

    factory Form.fromJson(Map<String, dynamic> json) {
        return Form(
            address_info:  AddressInfo.fromJson(json['address_info']) ,
            biographic_data:  BiographicData.fromJson(json['biographic_data'])  ,
            passport_data:  PassportData.fromJson(json['passport_data']) ,
            personal_data:  PersonalData.fromJson(json['personal_data']) ,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if (this.address_info != null) {
            data['address_info'] = this.address_info.toJson();
        }
        if (this.biographic_data != null) {
            data['biographic_data'] = this.biographic_data.toJson();
        }
        if (this.passport_data != null) {
            data['passport_data'] = this.passport_data.toJson();
        }
        if (this.personal_data != null) {
            data['personal_data'] = this.personal_data.toJson();
        }
        return data;
    }
}


