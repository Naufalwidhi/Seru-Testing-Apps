import 'dart:convert';

class AreaModel {
  AreaModel({
    required this.messages,
    required this.data,
  });

  final String messages;
  final List<AreaData> data;

  factory AreaModel.fromJson(String str) => AreaModel.fromMap(json.decode(str));

  factory AreaModel.fromMap(Map<String, dynamic> json) => AreaModel(
        messages: json["messages"],
        data:
            List<AreaData>.from(json["value"].map((x) => AreaData.fromMap(x))),
      );
}

class AreaData {
  AreaData({
    required this.id,
    required this.idArea,
    required this.name,
  });
  final String id;
  final String idArea;
  final String name;
  factory AreaData.fromJson(String str) => AreaData.fromMap(json.decode(str));
  factory AreaData.fromMap(Map<String, dynamic> json) => AreaData(
        id: json["id"],
        idArea: json["id_kecamatan"],
        name: json["name"],
      );
}
