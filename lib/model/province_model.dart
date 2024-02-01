import 'dart:convert';

class ProvinceModel {
  ProvinceModel({
    required this.messages,
    required this.data,
  });

  final String messages;
  final List<ProvinceData> data;

  factory ProvinceModel.fromJson(String str) =>
      ProvinceModel.fromMap(json.decode(str));

  factory ProvinceModel.fromMap(Map<String, dynamic> json) => ProvinceModel(
        messages: json["messages"],
        data: List<ProvinceData>.from(
            json["value"].map((x) => ProvinceData.fromMap(x))),
      );
}

class ProvinceData {
  ProvinceData({
    required this.id,
    required this.name,
  });
  final String id;
  final String name;
  factory ProvinceData.fromJson(String str) =>
      ProvinceData.fromMap(json.decode(str));
  factory ProvinceData.fromMap(Map<String, dynamic> json) => ProvinceData(
        id: json["id"],
        name: json["name"],
      );
}
