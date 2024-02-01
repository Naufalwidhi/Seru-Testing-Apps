import 'dart:convert';

class CityModel {
  CityModel({
    required this.messages,
    required this.data,
  });

  final String messages;
  final List<CityData> data;

  factory CityModel.fromJson(String str) => CityModel.fromMap(json.decode(str));

  factory CityModel.fromMap(Map<String, dynamic> json) => CityModel(
        messages: json["messages"],
        data:
            List<CityData>.from(json["value"].map((x) => CityData.fromMap(x))),
      );
}

class CityData {
  CityData({
    required this.id,
    required this.idProvince,
    required this.name,
  });
  final String id;
  final String idProvince;
  final String name;
  factory CityData.fromJson(String str) => CityData.fromMap(json.decode(str));
  factory CityData.fromMap(Map<String, dynamic> json) => CityData(
        id: json["id"],
        idProvince: json["id_provinsi"],
        name: json["name"],
      );
}
