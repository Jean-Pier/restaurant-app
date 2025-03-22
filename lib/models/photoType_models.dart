import 'dart:convert';

class PhotoType {
  List<Datum> data;
  String message;

  PhotoType({required this.data, required this.message});

  factory PhotoType.fromJson(String str) => PhotoType.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PhotoType.fromMap(Map<String, dynamic> json) => PhotoType(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
    message: json["message"],
  );

  Map<String, dynamic> toMap() => {
    "data": List<dynamic>.from(data.map((x) => x.toMap())),
    "message": message,
  };
}

class Datum {
  String uuid;
  String name;
  String description;

  Datum({required this.uuid, required this.name, required this.description});

  factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
    uuid: json["uuid"],
    name: json["name"],
    description: json["description"],
  );

  Map<String, dynamic> toMap() => {
    "uuid": uuid,
    "name": name,
    "description": description,
  };
}
