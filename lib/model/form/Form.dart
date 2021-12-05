import 'AddressInfo.dart';
import 'BiographicData.dart';
import 'PassportData.dart';
import 'PersonalData.dart';

class FormData {
    AddressInfo address_info;
    BiographicData biographic_data;
    PassportData passport_data;
    PersonalData personal_data;

    FormData({required this.address_info, required this.biographic_data, required this.passport_data, required this.personal_data});

    factory FormData.fromJson(Map<String, dynamic> json) {
        return FormData(
            address_info:  AddressInfo.fromJson(json['address_info']) ,
            biographic_data:  BiographicData.fromJson(json['biographic_data'])  ,
            passport_data:  PassportData.fromJson(json['passport_data']) ,
            personal_data:  PersonalData.fromJson(json['personal_data']) ,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
            data['address_info'] = this.address_info.toJson();
            data['biographic_data'] = this.biographic_data.toJson();
            data['passport_data'] = this.passport_data.toJson();
            data['personal_data'] = this.personal_data.toJson();

        return data;
    }
}


