import 'dart:convert';

List<AnnouncementModel> announcementModelFromJson(String str) =>
    List<AnnouncementModel>.from(
        json.decode(str).map((x) => AnnouncementModel.fromJson(x)));

String announcementModelToJson(List<AnnouncementModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AnnouncementModelMaterial {
  String? name;
  String? desc;

  AnnouncementModelMaterial({
    this.name,
    this.desc,
  });
  AnnouncementModelMaterial.fromJson(Map<String, dynamic> json) {
    name = json['name']?.toString();
    desc = json['desc']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['desc'] = desc;
    return data;
  }
}

class AnnouncementModelTeacher {
  String? name;
  String? image;
  String? material;

  AnnouncementModelTeacher({
    this.name,
    this.image,
    this.material,
  });
  AnnouncementModelTeacher.fromJson(Map<String, dynamic> json) {
    name = json['name']?.toString();
    image = json['image']?.toString();
    material = json['material']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['image'] = image;
    data['material'] = material;
    return data;
  }
}

class AnnouncementModel {
  AnnouncementModelTeacher? teacher;
  AnnouncementModelMaterial? material;

  AnnouncementModel({
    this.teacher,
    this.material,
  });
  AnnouncementModel.fromJson(Map<String, dynamic> json) {
    teacher = (json['teacher'] != null)
        ? AnnouncementModelTeacher.fromJson(json['teacher'])
        : null;
    material = (json['material'] != null)
        ? AnnouncementModelMaterial.fromJson(json['material'])
        : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (teacher != null) {
      data['teacher'] = teacher!.toJson();
    }
    if (material != null) {
      data['material'] = material!.toJson();
    }
    return data;
  }
}
