import 'dart:convert';

class DistrictModel {
  DistrictModel({
    required this.messages,
    required this.data,
  });

  final String messages;
  final List<DistrictData> data;

  factory DistrictModel.fromJson(String str) => DistrictModel.fromMap(json.decode(str));

  factory DistrictModel.fromMap(Map<String, dynamic> json) => DistrictModel(
        messages: json["messages"],
        data:
            List<DistrictData>.from(json["value"].map((x) => DistrictData.fromMap(x))),
      );
}

class DistrictData {
  DistrictData({
    required this.id,
    required this.idCity,
    required this.name,
  });
  final String id;
  final String idCity;
  final String name;
  factory DistrictData.fromJson(String str) => DistrictData.fromMap(json.decode(str));
  factory DistrictData.fromMap(Map<String, dynamic> json) => DistrictData(
        id: json["id"],
        idCity: json["id_kabupaten"],
        name: json["name"],
      );
}
