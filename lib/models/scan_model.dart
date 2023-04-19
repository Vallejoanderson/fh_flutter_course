import 'dart:convert';

ScanModel scanModelFromJson(String str) => ScanModel.fromJson(json.decode(str));

String scanModelToJson(ScanModel data) => json.encode(data.toJson());

class ScanModel {
  ScanModel({
    this.id,
    this.type,
    required this.value,
  }) {
    if (value.contains('http')) {
      type = 'http';
    } else {
      type = 'geo';
    }
  }

  int? id;
  String? type;
  String value;

  factory ScanModel.fromJson(Map<String, dynamic> json) => ScanModel(
        id: json["id"],
        type: json["type"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "value": value,
      };

  @override
  String toString() {
    return 'ScanModel{id: $id, value: $value}'; // Asegúrate de reemplazar 'id' y 'value' con los atributos reales de tu clase.
  }
}
